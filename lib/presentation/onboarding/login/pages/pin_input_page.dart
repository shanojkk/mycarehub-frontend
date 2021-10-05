// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/key_pad_widget.dart';

class PINInputPage extends StatefulWidget {
  /// [PINInputPage] is a widget used to input and validate user pin before accessing
  /// [MyHealth] section of the app
  ///
  /// It takes in a required [pinController]
  const PINInputPage({required this.pinController, required this.pin});

  @override
  _PINInputPageState createState() => _PINInputPageState();
  final TextEditingController pinController;
  final String pin;
}

class _PINInputPageState extends State<PINInputPage> {
  late bool isCorrectPin = false;
  final int maxTries = 4;
  late int tries = 0;
  late String errorMessage = '';
  late Timer timer;
  late int _start = 300;
  late bool canEnterPin = true;
  late TextStyle errorMessageStyle =
      TextThemes.boldSize12Text(AppColors.wrongPinTextColor);

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            errorMessageStyle =
                TextThemes.boldSize12Text(AppColors.wrongPinTextColor);
            errorMessage = '';
            canEnterPin = true;
            tries = 0;
            return;
          });
        } else {
          setState(() {
            _start--;
            errorMessageStyle = TextThemes.heavySize12Text(AppColors.redColor);
            errorMessage = tooManyTriesString(_start);
            canEnterPin = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late String enteredPin = '';
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAfyaHubAppBar(
        trailingWidget: Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: SvgPicture.asset(
            notificationIcon,
            width: 20,
          ),
        ),
        leadingWidget: mediumHorizontalSizedBox,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            veryLargeVerticalSizedBox,
            SvgPicture.asset(
              lockIcon,
              width: 30.0,
              height: 40.0,
            ),
            veryLargeVerticalSizedBox,
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    enterChatPINString,
                    style: TextThemes.boldSize15Text(AppColors.secondaryColor)
                        .copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                                color: Theme.of(context).backgroundColor,
                                width: 1.5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: widget.pinController,
                            obscureText: true,
                            readOnly: true,
                            obscuringCharacter: '*',
                            textAlign: TextAlign.center,
                            style: TextThemes.normalSize24Text(
                                AppColors.secondaryColor),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      Text(
                        errorMessage,
                        style: errorMessageStyle,
                      ),
                    ],
                  ),
                ),
                KeyPadWidget(
                  key: keyPadWidgetKey,
                  onChange: (String pin) {
                    widget.pinController.text = pin;
                    setState(() {
                      enteredPin = widget.pinController.text;
                      if (enteredPin.length == 4) {
                        tries = tries + 1;
                        if (enteredPin != widget.pin) {
                          if (tries % maxTries != 0) {
                            errorMessageStyle = TextThemes.boldSize12Text(
                                AppColors.wrongPinTextColor);
                            errorMessage = wrongPINString;
                            widget.pinController.text = '';
                          } else {
                            _startTimer();
                            widget.pinController.text = '';
                          }
                        } else {
                          errorMessage = '';
                          return;
                        }
                      }
                    });
                  },
                  pinController: widget.pinController,
                  isCorrectPin: isCorrectPin,
                  canEnterPin: canEnterPin,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    child: Text(
                      forgotPINString,
                      style:
                          TextThemes.normalSize15Text(AppColors.secondaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}