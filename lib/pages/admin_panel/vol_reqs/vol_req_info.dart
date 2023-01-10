import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/components/show_toast.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../../components/text_builder.dart';
import '../../../generated/app_user.pb.dart';
import '../../../providers/providers.dart';
import '../../../services/user_service.dart';

class VolReqInfoPage extends ConsumerStatefulWidget {
  final AppUser reqInfo;

  const VolReqInfoPage({Key? key, required this.reqInfo}) : super(key: key);

  @override
  ConsumerState<VolReqInfoPage> createState() => _VolReqInfoPageState();
}

class _VolReqInfoPageState extends ConsumerState<VolReqInfoPage> {
  late final AppUser reqInfo;
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    reqInfo = widget.reqInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: "Заявка в меценаты",
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              pairTextBuilder("Имя:", reqInfo.name),
              const SizedBox(
                height: 10,
              ),
              pairTextBuilder("Фамилия:", reqInfo.surName),
              const SizedBox(
                height: 10,
              ),
              pairTextBuilder("Email:", reqInfo.email),
              const SizedBox(
                height: 10,
              ),
              pairTextBuilder(
                  "Область проживания:", reqInfo.volRequest.livArea),
              const SizedBox(
                height: 10,
              ),
              pairTextBuilder("Пол:", sexMap[reqInfo.volRequest.sex] ?? ""),
              const SizedBox(
                height: 10,
              ),
              pairTextBuilder("Возраст:", reqInfo.volRequest.age.toString()),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      style: styles.acceptElevatedButtonStyle,
                      onPressed: () async {
                        final nav = Navigator.of(context);
                        final isSuccessful = await userService.acceptVolReq(reqInfo);
                        if(isSuccessful) {
                          nav.pop();
                        } else {
                          showFailureMessage("Ошибка");
                        }
                      },
                      child: const Text("Принять"),
                    ),
                    ElevatedButton(
                      style: styles.declineElevatedButtonStyle,
                      onPressed: () async {
                        final nav = Navigator.of(context);
                        final isSuccessful = await userService.declineVolReq(reqInfo);
                        if(isSuccessful) {
                          nav.pop();
                        } else {
                          showFailureMessage("Ошибка");
                        }
                      },
                      child: const Text("Отклонить"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
