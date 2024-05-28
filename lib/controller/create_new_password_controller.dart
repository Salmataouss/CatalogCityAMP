import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  var enterPassword = false.obs;
  var conformPassword = false.obs;
}
