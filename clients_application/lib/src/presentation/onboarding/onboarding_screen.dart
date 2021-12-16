import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/get_started/get_started.dart';
import 'package:flutter_app/src/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboadringViewModel? _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<OnboadringViewModel>(
        onViewModelReady: (viewModel) => _viewModel = viewModel!..init(),
        viewModel: OnboadringViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: _buildBody(),
          );
        });
  }

  _buildBody() {
    return Container(
      color: Color(int.parse(
          'FF${_viewModel!.listOnboards![_viewModel!.curentPage].backgroundColor}',
          radix: 16)),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildOnboardingContent(),
          ),
          Expanded(flex: 1, child: _buildFooter())
        ],
      ),
    );
  }

// Build content onboarding
  Widget _buildOnboardingContent() {
    return PageView.builder(
      onPageChanged: (index) => _viewModel?.onPageChange(index),
      itemCount: _viewModel?.listOnboards?.length,
      controller: _viewModel?.pageviewController,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            // Onboarding Image
            Image.asset(
              _viewModel!.listOnboards![index].imagePath.toString(),
              height: Get.height / 2.5,
            ),
            // Onboarding content
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                children: [
                  // Onboarding title
                  Text(_viewModel!.listOnboards![index].title.toString(),
                      style: STYLE_MEDIUM_BOLD.copyWith(
                          fontSize: 30 * Get.textScaleFactor,
                          color: Colors.white),
                      textAlign: TextAlign.center),
                  // Onboarding description
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                        _viewModel!.listOnboards![index].description.toString(),
                        style: STYLE_MEDIUM.copyWith(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// build footer onboading
  _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDot(),
          _buildAction(),
        ],
      ),
    );
  }

// Build dot list onboadring
  _buildDot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _viewModel!.listOnboards!.length,
        (index) => AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: 2),
          duration: Duration(milliseconds: 300),
          height: 6,
          width: _viewModel?.curentPage == index ? 20 : 6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  // Build action onboarding
  _buildAction() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: _viewModel!.curentPage + 1 != _viewModel!.listOnboards!.length
          // Build next onboarding
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Skip",
                  style: STYLE_MEDIUM_BOLD.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    Text("Next",
                        style: STYLE_MEDIUM_BOLD.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            )
          // build button start home app
          : ElevatedButton(
              onPressed: () => _viewModel!.onStarting(),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 50),
                  // onSurface: Colors.white,
                  primary: Colors.white),
              child: Text(
                "Get started!",
                style: STYLE_SMALL_BOLD.copyWith(color: Colors.black),
              ),
            ),
    );
  }
}
