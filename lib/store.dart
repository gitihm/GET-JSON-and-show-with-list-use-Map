import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Store with ChangeNotifier {
  Store();
   String _dataUrl = "";

  String _displayText = "";
  Map<String , dynamic> _jsonResonse ;
  bool _isFetching = false;

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;

  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    
    _isFetching = true;
    notifyListeners();
    print('aaaa');
    try {
      print('in try');
      var response = await http.get(_dataUrl);
      print('res');
      print(response.statusCode);
      if (response.statusCode == 200) {
        
        _jsonResonse = json.decode(response.body);
      }

      _isFetching = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
    
    
  }

  Map<String , dynamic> get getResponseText => _jsonResonse;

   Map<String , dynamic> getResponseJson() {
     print('cccc');
    //if (_jsonResonse.isNotEmpty) {
      return _jsonResonse;
    //}
    //return null;
  }

 
}
