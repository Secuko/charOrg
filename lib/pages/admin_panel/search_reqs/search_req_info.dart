import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/components/show_toast.dart';
import 'package:vol_org/generated/search_request.pb.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../../components/text_builder.dart';
import '../../../providers/providers.dart';
import '../../../services/user_service.dart';

class SearchReqInfoPage extends ConsumerStatefulWidget {
  final SearchRequest reqInfo;

  const SearchReqInfoPage({Key? key, required this.reqInfo}) : super(key: key);

  @override
  ConsumerState<SearchReqInfoPage> createState() => _SearchReqInfoPageState();
}

class _SearchReqInfoPageState extends ConsumerState<SearchReqInfoPage> {
  late final SearchRequest reqInfo;
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
        title: "Заявка на сбор средств",
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: CachedNetworkImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      imageUrl: reqInfo.photo,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) {
                        return Image.network(
                          "assets/img/placeholder.jpg",
                          fit: BoxFit.cover,
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  pairTextBuilder("ФИО:", reqInfo.fullName),
                  const SizedBox(
                    height: 10,
                  ),
                  pairTextBuilder("Возраст:", reqInfo.age.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  pairTextBuilder("Пол:", sexMap[reqInfo.sex] ?? ""),
                  const SizedBox(
                    height: 10,
                  ),
                  pairTextBuilder("Область пропажи:", reqInfo.missArea),
                  const SizedBox(
                    height: 10,
                  ),
                  pairTextBuilder("Необходимая сумма:", reqInfo.missTime),
                  const SizedBox(
                    height: 10,
                  ),
                  pairTextBuilder("Доп. информация:", reqInfo.addInf),
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
                            final isSuccessful =
                                await userService.acceptSearchReq(reqInfo);
                            if (isSuccessful) {
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
                            final isSuccessful =
                                await userService.declineSearchReq(reqInfo);
                            if (isSuccessful) {
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
          ],
        ),
      ),
    );
  }
}
