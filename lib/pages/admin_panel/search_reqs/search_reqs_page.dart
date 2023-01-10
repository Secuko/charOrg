import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/pages/admin_panel/search_reqs/search_req_info.dart';
import 'package:vol_org/pages/admin_panel/vol_reqs/vol_req_info.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/services/user_service.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../../generated/app_user.pb.dart';

class SearchReqsPage extends ConsumerStatefulWidget {
  const SearchReqsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SearchReqsPageState();
}

class _SearchReqsPageState extends ConsumerState<SearchReqsPage> {
  @override
  Widget build(BuildContext context) {
    final searchReqs = ref.watch(pendingReqsProvider);
    final userService = UserService();

    return Scaffold(
        appBar: AppBarBack(
          title: "Заявки на сбор средств",
          context: context,
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: searchReqs.when(
          data: (data) {
            return ListView.separated(
              itemCount: data.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                final req = data[index];

                return FutureBuilder(
                    future: userService.getUser(req.userId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final user = snapshot.data ?? AppUser();
                        return ListTile(
                          title: Text("${user.surName} ${user.name}"),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: styles.baseColors.cyan,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchReqInfoPage(reqInfo: req),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        log(snapshot.error.toString());
                        return const Text("Ошибка загрузки");
                      } else {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    });
              },
            );
          },
          error: (e, s) => const Text("Ошибка загрузки"),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}
