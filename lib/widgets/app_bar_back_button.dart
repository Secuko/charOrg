import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vol_org/pages/credentials/registr_page.dart';
import 'package:vol_org/pages/profile/profile_page.dart';

class AppBarBack extends AppBar {
  AppBarBack({
    Key? key,
    required String title,
    void Function()? onBack,
    bool showProfile = true,
    Color? backgroundColor,
    required BuildContext context,
  }) : super(
          key: key,
          title: Text(title),
          leading: onBack != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                )
              : null,
          actions: [
            if(showProfile)
            IconButton(
              icon: const Icon(Icons.person_rounded),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirebaseAuth.instance.currentUser != null ? const ProfilePage() : const RegistrationPage(),
                  ),
                );
              },
            ),
          ],
          backgroundColor: backgroundColor,
        );
}
