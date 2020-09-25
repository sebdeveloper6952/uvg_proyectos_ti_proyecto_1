import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String title;

  ProgressDialog({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: Text(title),
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
