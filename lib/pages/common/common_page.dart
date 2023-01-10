import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/generated/app_user.pb.dart';
import 'package:vol_org/pages/common/search_req_page.dart';
import 'package:vol_org/pages/common/vol_req_page.dart';
import 'package:vol_org/pages/credentials/registr_page.dart';
import 'package:vol_org/providers/providers.dart';
import 'package:vol_org/services/auth.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

import '../../widgets/ElevatedButtonRightIcon.dart';

class CommonPage extends ConsumerStatefulWidget {
  const CommonPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _CommonPagePageState();
}

class _CommonPagePageState extends ConsumerState<CommonPage> {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final curUser = ref.watch(currentUserProvider).value ?? AppUser();

    return Scaffold(
      appBar: AppBarBack(
        title: "Главная",
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButtonRightIcon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchReqPage();
                    },
                  ),
                );
              },
              label: Text(
                "Подать заявку на сбор средств",
                style: styles.mainTextTheme.titleSmall,
              ),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
            if(curUser.role != AppUser_Role.VOLUNTEER)
            ...[
              const SizedBox(
                height: 15,
              ),
              ElevatedButtonRightIcon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const VolReqPage();
                      },
                    ),
                  );
                },
                label: Text("Стать меценатом",
                    style: styles.mainTextTheme.titleSmall),
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
