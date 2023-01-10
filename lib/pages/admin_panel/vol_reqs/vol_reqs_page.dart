import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/pages/admin_panel/vol_reqs/vol_req_info.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

class VolReqsPage extends ConsumerStatefulWidget {
  const VolReqsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _VolReqsPageState();
}

class _VolReqsPageState extends ConsumerState<VolReqsPage> {
  @override
  Widget build(BuildContext context) {
    final users = ref.watch(allUsersProvider);

    return Scaffold(
        appBar: AppBarBack(
          title: "Заявки в меценаты",
          context: context,
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: users.when(
          data: (data) {
            final usersList = ref.watch(usersWithVolReqsProvider(data));

            return ListView.separated(
              itemCount: usersList.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                final info = usersList[index];
                return ListTile(
                  title: Text("${info.surName} ${info.name}"),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: styles.baseColors.cyan,
                    size: 30,
                  ),
                  /*ElevatedButton(
                    style: styles.checkElevatedButtonStyle,
                    onPressed: () {},
                    child: const Text("Просмотреть"),
                  ),*/
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VolReqInfoPage(reqInfo: info)));
                  },
                );
              },
            );
          },
          error: (e, s) => const Text("Ошибка загрузки"),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}
