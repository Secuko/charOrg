import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/pages/admin_panel/admin_page.dart';
import 'package:vol_org/pages/common/common_page.dart';
import 'package:vol_org/pages/messages/messages_page.dart';
import 'package:vol_org/pages/operations/operations_page.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/styles/styles.dart';

enum TabType { common, messages, operations, admin }

class AppShell extends ConsumerStatefulWidget {
  const AppShell({Key? key}) : super(key: key);

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  final routeMap = {0: "common", 1: "messages", 2: "operations", 3: "admin"};

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    final appUser = ref.read(currentUserProvider).value;
    final tabList = ref.read(tabListProvider(appUser));

    tabController = TabController(
        length: tabList.length,
        vsync: this,
        initialIndex: TabType.common.index);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).value;
    final appUser = ref.watch(currentUserProvider).value;

    final tabList = ref.read(tabListProvider(appUser));

    if (tabList.length != tabController?.length) {
      tabController?.dispose();
      tabController = TabController(
        length: tabList.length,
        initialIndex: TabType.common.index,
        vsync: this,
      );
    }

    return Container(
      decoration: styles.backgroundDecoration,
      child: Scaffold(
        body: TabBarView(
            key: const Key("tabbar"),
            controller: tabController,
            children: tabList.map<Widget>((tab) {
              Widget content = const SizedBox.shrink();
              switch (tab) {
                case TabType.common:
                  content = const CommonPage(key: Key("common"));
                  break;
                case TabType.messages:
                  content = const MessagesPage(key: Key("messages"));
                  break;
                case TabType.operations:
                  content = const OperationsPage(key: Key("operations"));
                  break;
                case TabType.admin:
                  content = const AdminPanelPage(key: Key("admin"));
                  break;
              }
              return content;
            }).toList()),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            alignment: Alignment.center,
            color: styles.themeColors.brand.withOpacity(0.6),
            height: kBottomNavigationBarHeight,
            child: TabBar(
              labelStyle:
                  styles.mainTextTheme.labelSmall?.copyWith(fontSize: 9),
              controller: tabController,
              indicatorColor: styles.themeColors.text,
              tabs: tabList.map<Widget>((tab) {
                Widget? content;
                switch (tab) {
                  case TabType.common:
                    content = const Tab(
                        icon: Icon(Icons.home), child: Text("Главная"));
                    break;
                  case TabType.messages:
                    if (user != null) {
                      content = const Tab(
                          icon: Icon(Icons.mail), child: Text("Сообщения"));
                    }
                    break;
                  case TabType.operations:
                    content = const Tab(
                        icon: Icon(Icons.search), child: Text("Операции"));
                    break;
                  case TabType.admin:
                    if (user != null) {
                      content = const Tab(
                          icon: Icon(Icons.security), child: Text("Админ"));
                    }
                    break;
                }
                if (content == null) {
                  return const SizedBox.shrink();
                }
                return content;
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
