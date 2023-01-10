import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/generated/search_request.pb.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../services/user_service.dart';
import '../../styles/styles.dart';
import '../admin_panel/search_reqs/search_req_info.dart';

class OperationsPage extends ConsumerStatefulWidget {
  const OperationsPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OperationsPageState();
}

class _OperationsPageState extends ConsumerState<OperationsPage> {

  @override
  Widget build(BuildContext context) {
    final operations = ref.watch(pendingOperationsProvider);
    final userService = UserService();

    return Scaffold(
      appBar: AppBarBack(
        title: "Сборы средств",
        context: context,
      ),
      body: operations.when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(
              height: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              final op = data[index];

              return FutureBuilder(
                  future: userService.getSearchReq(op.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final req = snapshot.data ?? SearchRequest();
                      return ListTile(
                        leading: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          child: CachedNetworkImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              width: 50,
                              imageUrl: req.photo,
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
                        title: Text("${req.fullName}, ${req.age} лет"),
                        subtitle: Text("${req.missArea}, ${req.missTime}"),

                        trailing: Icon(
                          Icons.arrow_forward,
                          color: styles.baseColors.cyan,
                          size: 30,
                        ),
                        onTap: () {
                          /*Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchReqInfoPage(reqInfo: op),
                            ),
                          );*/
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
