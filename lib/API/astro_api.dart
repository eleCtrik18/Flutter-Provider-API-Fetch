import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AstroAPI with ChangeNotifier {
  Map<String, dynamic> astroData = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => astroData;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchdata async {
    final url = 'https://www.astrotak.com/astroapi/api/agent/all';
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        print(data);
        astroData = data;
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
      }
      notifyListeners();
    } else {
      _error = true;
      _errorMessage = 'Unable to fetch data';
      notifyListeners();
    }
    void Initialize() {
      astroData = {};
      _error = false;
      _errorMessage = '';
      notifyListeners();
    }
  }
}
