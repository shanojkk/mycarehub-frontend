// Flutter imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/set_nickname_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/important_information_link_widget.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

class CongratulationsPage extends StatefulWidget {
  const CongratulationsPage({
    required this.duration,
  });

  final String duration;

  @override
  _CongratulationsPageState createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  String? name;

  final GlobalKey<FormState> _congratulationsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 6;

    // print(
    //   DateFormat('dd MMM yyyy')
    //           .parse('21 Nov 2021')
    //           .difference(DateFormat('dd MMM yyyy').parse('21 Nov 2020'))
    //           .inDays /
    //       365,
    // );

    return OnboardingScaffold(
      title: congratulationsPageTitle(widget.duration),
      description: congratulationsPageDescription,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nickNameString,
            style: TextThemes.boldSize16Text(Colors.grey),
          ),
          smallVerticalSizedBox,
          Form(
            key: _congratulationsFormKey,
            child: CustomTextField(
              formFieldKey: nameInputKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              borderColor: Colors.grey.withOpacity(0.5),
              maxLines: 1,
              keyboardType: TextInputType.name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return nameInputValidateString;
                }
              },
              onChanged: (String val) {
                setState(() {
                  name = val;
                });
              },
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          Text(
            importantInformationString,
            style: TextThemes.boldSize16Text(AppColors.secondaryColor),
          ),
          smallVerticalSizedBox,
          ImportantInformationWidget(),
          verySmallVerticalSizedBox,
          ImportantInformationWidget(),
          verySmallVerticalSizedBox,
          ImportantInformationWidget(),
          largeVerticalSizedBox,
          StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) =>
                AppStateViewModel.fromStore(store),
            builder: (BuildContext context, AppStateViewModel vm) {
              return SizedBox(
                width: double.infinity,
                height: 52,
                child: vm.appState.wait!.isWaitingFor(nickNameFlag)
                    ? const SILPlatformLoader(
                        color: AppColors.secondaryColor,
                      )
                    : MyAfyaHubPrimaryButton(
                        customRadius: 4,
                        text: continueString,
                        buttonColor: name == null
                            ? Colors.grey
                            : AppColors.secondaryColor,
                        borderColor: name == null
                            ? Colors.grey
                            : AppColors.secondaryColor,
                        onPressed: name == null
                            ? null
                            : () async {
                                if (_congratulationsFormKey.currentState!
                                    .validate()) {
                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    // set nickname action
                                    SetNickName(
                                      context: context,
                                      nickname: name!,
                                    ),
                                  );
                                }
                              },
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
