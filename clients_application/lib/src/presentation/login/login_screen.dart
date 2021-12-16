import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/login/login_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_button_custom.dart';
import 'package:flutter_app/src/presentation/widgets/widget_custom_devider.dart';
import 'package:flutter_app/src/presentation/widgets/widget_input_custom.dart';
import 'package:flutter_app/src/presentation/widgets/widget_input_password_custom.dart';
import 'package:flutter_app/src/utils/app_valid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
        onViewModelReady: (viewmodel) => _viewModel = viewmodel?..initial(),
        viewModel: LoginViewModel(),
        builder: (context, viewmodel, child) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  _buildFormInput(),
                  _buildFooter(),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MAIN_COLOR_LIGHT,
            ),
            child: IconButton(
                padding: EdgeInsets.zero,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: MAIN_COLOR,
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Login",
              style: STYLE_MEDIUM_BOLD.copyWith(
                  fontSize: 30 * Get.textScaleFactor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormInput() {
    print(_viewModel?.formKey);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Form(
              key: _viewModel?.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetCustomInput(
                    inputKey: _viewModel!.formKeyEmail,
                    controller: _viewModel!.emailController,
                    labelText: "Your Email",
                    validator: (value) => AppValid.validateEmail(value),
                    prefixRight: Icon(
                      Icons.check,
                      color: MAIN_COLOR,
                    ),
                  ),
                  SizedBox(height: 15),
                  WidgetCustomInputPassword(
                    controller: _viewModel!.passwordController,
                    validator: AppValid.validatePassword(),
                    labelText: "Password",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      child: Column(
        children: [
          _buildRememberMe(),
          _buildButtonFooter(),
        ],
      ),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      child: Row(
        children: [
          Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: MAIN_COLOR,
              value: _viewModel?.rememberMe,
              onChanged: (value) => _viewModel?.onRememberMe(value)),
          Text("Remember Me!", style: STYLE_SMALL_BOLD),
        ],
      ),
    );
  }

  Widget _buildButtonFooter() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetButtonCustom(
            text: "Login",
            backgroundColor: MAIN_COLOR,
            textColor: Colors.white,
            onpress: _viewModel!.onSignIn,
          ),
          WidgetCustomDevider(),
          _buildSocialButton(),
        ],
      ),
    );
  }

  _buildSocialButton() {
    return Container(
      child: Column(
        children: [
          _loginGoogleButton(),
          SizedBox(height: 15),
          _loginFacebookButton(),
        ],
      ),
    );
  }

  // Login with google button
  Widget _loginGoogleButton() {
    return Container(
      child: WidgetButtonCustom(
        onpress: () => {},
        prefix: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red,
          size: 18,
        ),
        text: "Countinute with Google",
      ),
    );
  }

  Widget _loginFacebookButton() {
    return Container(
      child: WidgetButtonCustom(
        onpress: () => {},
        prefix: Icon(
          Icons.facebook_outlined,
          color: Colors.blue,
        ),
        text: "Countinute with Facebook",
      ),
    );
  }
}
