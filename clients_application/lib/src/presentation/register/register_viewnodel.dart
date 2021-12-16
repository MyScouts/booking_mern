import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/repo/repo.dart';

class RegisterViewModel extends BaseViewModel {
  bool acceptTern = false;
  // formGloble
  final GlobalKey<FormState> formKeyFirstName = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyLastName = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // text editingcontroller
  final passwordController = new TextEditingController();
  final passwordConfirmController = new TextEditingController();
  final emailController = new TextEditingController();
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();

  static AuthRepository authRespon = AuthRepository();
  initial() async {
    // await authRespon.getLoginRespons();
  }

  onAcceptTern(value) {
    acceptTern = value;
    notifyListeners();
  }

  onRegister() {
    if (formKey.currentState!.validate() &&
        formKeyFirstName.currentState!.validate() &&
        formKeyLastName.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }
}
