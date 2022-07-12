import 'dart:async';
import 'dart:convert';

import 'package:crypto/constants.dart';
import 'package:crypto/services/api.dart';
import 'package:flutter/material.dart';

import '../../model/FinalModel.dart';

class AppNotifiers extends ChangeNotifier {
  bool _signInType = true;
  bool get signInType => _signInType;

  void changeSignInUpType() {
    _signInType = !_signInType;
    notifyListeners();
  }

  // Obscure

  bool _isVisible = true;
  bool get isVisible => _isVisible;

  get switchObsIcon {
    return _isVisible
        ? const Icon(
            Icons.visibility_off,
            color: kGrey,
          )
        : const Icon(
            Icons.visibility,
            color: kGrey,
          );
  }

  void toggleObs() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  //API CRYPTO
  final CryptoAPI cryptoAPI = CryptoAPI();

  Future<FinalModel>getFinalData() async {
    var res = await cryptoAPI.cryptoApi();
    //print(res);
    var data = jsonDecode(res);
    return FinalModel.fromJson(data);
  }
}
