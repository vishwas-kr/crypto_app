import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:crypto/constants.dart';
import 'package:crypto/model/crypto_symbol.dart';
import 'package:crypto/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future getData() async {
   
    var data = await cryptoAPI.getData();
    final Map<String, dynamic> parseData = await jsonDecode(data);
    var x = parseData['data'];
    return x.map((datax) => CryptoData.fromJson(datax)).toList();
  }
}
