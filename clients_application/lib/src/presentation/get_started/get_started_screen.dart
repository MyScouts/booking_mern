import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/get_started/get_started_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/widgets/widget_button_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  GetStartedViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<GetStartedViewModel>(
        onViewModelReady: (viewModel) => _viewModel = viewModel?..initial(),
        viewModel: GetStartedViewModel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            body: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _buildTextHead(),
          ),
          Expanded(
            flex: 3,
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextHead() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Get started now",
        textAlign: TextAlign.center,
        style: STYLE_MEDIUM_BOLD,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSocialButton(),
        _loginEmailButton(),
      ],
    );
  }

  _buildSocialButton() {
    return Column(
      children: [
        Image.asset(
          AppImages.imgBgStarted,
          height: Get.height / 3,
        ),
        Container(
          padding: EdgeInsets.only(left: 50, top: 30, right: 50, bottom: 10),
          child: Column(
            children: [
              _loginFacebookButton(),
              SizedBox(height: 15),
              _loginGoogleButton(),
            ],
          ),
        ),
      ],
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

// sign up with email
  Widget _loginEmailButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        children: [
          WidgetButtonCustom(
            backgroundColor: Color(0xFF5F86E5),
            onpress: () => Get.toNamed(Routers.register),
            text: "Signup with Email",
            textColor: Colors.white,
          ),
          _buildFooter()
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Existing account?",
            style: STYLE_SMALL_BOLD.copyWith(color: Colors.grey),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () => Get.toNamed(Routers.login),
            child: Text(
              "Login now",
              style: STYLE_SMALL_BOLD.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
