import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuf/protobuf.dart';
import 'package:vol_org/components/image_picker.dart';
import 'package:vol_org/generated/vol_request.pb.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../components/show_toast.dart';
import '../../generated/search_request.pb.dart';
import '../../services/user_service.dart';

class SearchReqPage extends ConsumerStatefulWidget {
  const SearchReqPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _SearchReqPageState();
}

class _SearchReqPageState extends ConsumerState<SearchReqPage> {
  final fullNameController = TextEditingController();
  final ageController = TextEditingController();
  final missAreaController = TextEditingController();
  final missTimeController = TextEditingController();

  ///TODO возможно сделать через таймпикер
  final addInfController = TextEditingController();
  final photoUrlController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final UserService userService = UserService();
  var searchReq = SearchRequest(status: Status.PENDING)..freeze();

  @override
  void initState() {
    super.initState();
    final curUser = ref.read(currentUserProvider).value;
    searchReq = searchReq.rebuild((p0) {
      p0.userId = curUser?.id ?? "";
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    missAreaController.dispose();
    missTimeController.dispose();
    addInfController.dispose();
    photoUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarBack(
          title: "Заявка на сбор средств",
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImagePicker(
                    url: searchReq.photo,
                    savePath: "searchReqs/",
                    height: 100,
                    shape: BoxShape.circle,
                    onChanged: (url) {
                      setState(() {
                        searchReq = searchReq.rebuild((p0) {
                          p0.photo = url;
                        });
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: fullNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "ФИО",
                      hintText: "Иванов Иван Иванович",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (str) {
                      if (str != null && str.length < 5) {
                        return 'Минимум 5 символов';
                      }
                      return null;
                    },
                    onChanged: (str) {
                      searchReq = searchReq.rebuild((p0) {
                        p0.fullName = str;
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
                      searchReq = searchReq.rebuild((p0) {
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
                    value: searchReq.hasSex() ? searchReq.sex : null,
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
                          searchReq = searchReq.rebuild((p0) {
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
                    controller: missAreaController,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: "Область проживания",
                      hintText: "Владимир, пр-т Ленина",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (str) {
                      if (str != null && str.length < 3) {
                        return "Заполните поле";
                      }
                      return null;
                    },
                    onChanged: (str) {
                      searchReq = searchReq.rebuild((p0) {
                        p0.missArea = str;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: missTimeController,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: "Необходимая сумма",
                      hintText: "10000 Рублей",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (str) {
                      if (str != null && str.length < 3) {
                        return "Заполните поле";
                      }
                      return null;
                    },
                    onChanged: (str) {
                      searchReq = searchReq.rebuild((p0) {
                        p0.missTime = str;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addInfController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Доп. информация",
                      hintText: "Деньги нужны на учебу",
                    ),
                    onChanged: (str) {
                      searchReq = searchReq.rebuild((p0) {
                        p0.addInf = str;
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

                        final isSuccessful =
                            await userService.addOrUpdateSearchReq(searchReq);
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
    );
  }
}
