import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuf/protobuf.dart';
import 'package:vol_org/generated/app_user.pb.dart';
import 'package:vol_org/generated/vol_request.pb.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../components/show_toast.dart';
import '../../services/user_service.dart';

class VolReqPage extends ConsumerStatefulWidget {
  const VolReqPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _VolReqPageState();
}

class _VolReqPageState extends ConsumerState<VolReqPage> {
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final livAreaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final UserService userService = UserService();
  var volReq = VolRequest(status: Status.PENDING)..freeze();

  @override
  void dispose() {
    phoneController.dispose();
    ageController.dispose();
    livAreaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curUser = ref.watch(currentUserProvider).value;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarBack(
          title: "Заявка в меценаты",
          context: context,
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          labelText: "Номер телефона",
                          hintText: "+79028846651"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (str) {
                        if (!RegExp(r'(^(?:[+0]7)?[0-9]{10,12}$)')
                            .hasMatch(str ?? '')) {
                          return 'Неверный формат номера';
                        }
                        return null;
                      },
                      onChanged: (str) {
                        volReq = volReq.rebuild((p0) {
                          p0.phone = str;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: ageController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          labelText: "Возраст", hintText: "18"),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (str) {
                        final parsedStr = int.tryParse(str ?? '0') ?? 0;
                        if (str == null || parsedStr <= 0 || parsedStr >= 100) {
                          return "Введите корректный возраст";
                        }
                        return null;
                      },
                      onChanged: (str) {
                        volReq = volReq.rebuild((p0) {
                          p0.age = int.tryParse(str) ?? 0;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButton2<Sex>(
                      buttonWidth: 120,
                      isExpanded: true,
                      hint: const Text("Пол"),
                      dropdownDecoration: BoxDecoration(
                          color: styles.themeColors.cardSecondaryColor),
                      value: volReq.hasSex() ? volReq.sex : null,
                      items: sexMap.keys
                          .map(
                            (key) => DropdownMenuItem(
                              value: key,
                              child: Text(sexMap[key] ?? ""),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            volReq = volReq.rebuild((p0) {
                              p0.sex = value;
                            });
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: livAreaController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          labelText: "Область проживания",
                          hintText: "Владимир"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (str) {
                        if (str != null && str.length < 3) {
                          return "Заполните поле";
                        }
                        return null;
                      },
                      onChanged: (str) {
                        volReq = volReq.rebuild((p0) {
                          p0.livArea = str;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: styles.maxElevatedButtonStyle,
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? true) {
                          final nav = Navigator.of(context);

                          final isSuccessful = await userService
                              .addOrUpdateVolReq(curUser ?? AppUser(), volReq);
                          if (isSuccessful) {
                            showSuccessMessage("Заявка отправлена");
                            formKey.currentState?.reset();
                            nav.pop();
                          } else {
                            showFailureMessage("Ошибка отправления заявки");
                          }
                        }
                      },
                      child: Text(
                        "Отправить",
                        style: styles.mainTextTheme.bodyLarge
                            ?.copyWith(letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
