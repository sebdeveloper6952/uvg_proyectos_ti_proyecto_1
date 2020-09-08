import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/shared/progress_dialog.dart';

class Utils {
  static void showProgressDialog(BuildContext c, String title) {
    showDialog(
      context: c,
      builder: (c) => WillPopScope(
        onWillPop: () async => false,
        child: ProgressDialog(
          title: title,
        ),
      ),
      barrierDismissible: false,
    );
  }
}
