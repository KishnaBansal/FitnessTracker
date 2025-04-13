import 'dart:convert';

import 'package:fitness_app/config.dart';
import 'package:fitness_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  final UserProvider userProvider;
  AuthProvider(this.userProvider);
  static Future<String?> loginUser(String email, String password) async {
    try {
      var reqBody = {
        "email": email,
        "password": password,
      };
      var response = await http.post(
        Uri.parse(login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(reqBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == "User logged in Successfully") {
          print(jsonResponse['message']);
          return jsonResponse['message'];
        } else {
          print("Authentication Failed: ${jsonResponse['message']}");
          return null;
        }
      } else {
        print("Server Error: ${response.statusCode}");
        print("Server Error: ${response.body}");
        return null;
      }
    } catch (err) {
      print("Error: $err");
      return null;
    }
  }
}
