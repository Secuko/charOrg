import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/pages/admin_panel/search_reqs/search_reqs_page.dart';
import 'package:vol_org/pages/admin_panel/vol_reqs/vol_reqs_page.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../styles/styles.dart';

class AdminPanelPage extends ConsumerStatefulWidget {
  const AdminPanelPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends ConsumerState<AdminPanelPage> {
  final GlobalKey<NavigatorState> commonNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(
          title: "Администрирование",
          context: context,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text("Заявки в меценаты"),
              trailing: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: styles.baseColors.grey.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "1",
                  style: styles.mainTextTheme.labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VolReqsPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Заявки на сбор средств"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchReqsPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Сборы средств"),
              trailing: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: styles.baseColors.grey.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "23",
                  style: styles.mainTextTheme.labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              onTap: () {},
            ),
          ],
        ));
  }
}
