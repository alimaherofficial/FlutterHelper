import 'package:flutter/material.dart';
import 'package:helper/core/presentation/widgets/custom_failure/custom_failure_screen_mobile.dart';
import 'package:helper/core/presentation/widgets/custom_failure/custom_failure_screen_tablet.dart';
import 'package:helper/core/presentation/widgets/responsive.dart';

/// this screen is used to show the deposit failure screen
class CustomFailureScreen extends StatelessWidget {
  /// constructor
  const CustomFailureScreen({
    required this.errorMessage,
    required this.buttonFunction,
    this.canPop = true,
    this.buttonText,
    super.key,
  });

  /// this is the error message
  final String errorMessage;

  /// this is the button text
  final String? buttonText;

  /// this is the button function
  final VoidCallback buttonFunction;

  /// this is the enable back button or not
  /// default is true
  /// if you want to disable the back button
  /// set it to false
  final bool canPop;
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: CustomFailureScreenMobile(
        errorMessage: errorMessage,
        buttonText: buttonText,
        buttonFunction: buttonFunction,
        canPop: canPop,
      ),
      tablet: const CustomFailureScreenTablet(),
    );
  }
}
