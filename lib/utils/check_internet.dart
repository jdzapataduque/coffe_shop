import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternet {
  Future<bool> valInternet(BuildContext context) async {
    var conex = await Connectivity().checkConnectivity();
    if (conex == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

  void ShowMsg(BuildContext context, String _title, String _msg) async {
    await showAlertDialog(
        context: context,
        title: _title,
        message: _msg,
        actions: <AlertDialogAction>[
          const AlertDialogAction(key: null, label: 'Aceptar')
        ]);
  }
}
