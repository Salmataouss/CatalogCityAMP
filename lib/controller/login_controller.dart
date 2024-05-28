import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  var passwordVisible = false.obs;
  var signPasswordVisible = false.obs;
  var signConFormPasswordVisible = false.obs;
}
