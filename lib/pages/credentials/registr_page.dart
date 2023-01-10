import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vol_org/components/show_toast.dart';
import 'package:vol_org/generated/app_user.pb.dart';
import 'package:vol_org/pages/credentials/authorization_page.dart';
import 'package:vol_org/services/auth.dart';
import 'package:vol_org/services/user_service.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();
  UserService userService = UserService();

  AppUser user = AppUser();

  @override
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: styles.backgroundDecoration,
        child: Scaffold(
          appBar: AppBarBack(
            title: "Регистрация",
            onBack: () {
              final nav = Navigator.of(context);
              if (nav.canPop()) nav.pop();
            },
            context: context,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            labelText: "Имя", hintText: "Имя"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (str) {
                          if (str != null && str.length < 2) {
                            return "Минимум 2 символа";
                          }
                          return null;
                        },
                        onChanged: (str) {
                          user.name = str;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: surNameController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            labelText: "Фамилия", hintText: "Фамилия"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (str) {
                          if (str != null && str.length < 2) {
                            return "Минимум 2 символа";
                          }
                          return null;
                        },
                        onChanged: (str) {
                          user.surName = str;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            labelText: "Email", hintText: "myemail@mail.ru"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (str) {
                          if (str != null && !EmailValidator.validate(str)) {
                            return "Некорректный email";
                          }
                          return null;
                        },
                        onChanged: (str) {
                          user.email = str;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: "Пароль", hintText: "mypassword"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (str) {
                          if (str != null && str.length < 8) {
                            return "Минимум 8 символов";
                          }
                          return null;
                        },
                        onChanged: (str) {
                          user.password = str;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: styles.maxElevatedButtonStyle,
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? true) {
                            try {
                              final nav = Navigator.of(context);
                              AppUser? newUser = await authService
                                  .registerWithEmailAndPassword(user);
                              if (newUser == null) {
                                showFailureMessage("Ошибка регистрации");
                              } else {
                                showSuccessMessage("Успешная регистрация");
                                await userService.addOrUpdateUser(newUser);
                                formKey.currentState?.reset();
                                nav.popUntil(ModalRoute.withName("/"));
                              }
                            } catch (e) {
                              log(e.toString());
                            }
                          }
                        },
                        child: Text(
                          "Зарегестрироваться",
                          style: styles.mainTextTheme.bodyLarge
                              ?.copyWith(letterSpacing: 0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Войти",
                          style: styles.mainTextTheme.labelLarge?.copyWith(
                              color: styles.themeColors.brand,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
