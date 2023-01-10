import 'package:fluttertoast/fluttertoast.dart';

import '../styles/styles.dart';

void showSuccessMessage(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: styles.themeColors.success,
  );
}

void showFailureMessage(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: styles.themeColors.danger,
  );
}