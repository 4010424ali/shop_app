import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String token;
  DateTime _expireDate;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    String appId = 'AIzaSyATAz_phjDdDPQBvH6AZAaI_tQ47OLLzq8';
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$appId";

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
