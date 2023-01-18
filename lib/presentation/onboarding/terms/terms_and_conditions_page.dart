// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/accept_terms_and_conditions_action.dart';
import 'package:pro_health_360/application/redux/actions/get_terms_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:unicons/unicons.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key, this.shouldPop});
  final bool? shouldPop;

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isAgreed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        GetTermsAction(context: context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: portalTermsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) =>
                AppStateViewModel.fromStore(store),
            builder: (BuildContext context, AppStateViewModel vm) {
              final TermsAndConditions? termsObject =
                  vm.appState.onboardingState!.termsAndConditions;
              return Column(
                children: <Widget>[
                  // Terms and Conditions Card
                  InformationListCard(
                    leadingIcon: const Center(
                      child: Icon(
                        UniconsLine.file_lock_alt,
                        size: 32,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    title: Text(
                      portalTermsText,
                      style: normalSize16Text(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    body: Text(
                      readAndAcceptText,
                      style: normalSize14Text(Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Terms and Conditions scrollable view
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      thickness: 10.0,
                      radius: const Radius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child:
                                  vm.appState.wait!.isWaitingFor(getTermsFlag)
                                      ? Container(
                                          height: 300,
                                          padding: const EdgeInsets.all(20),
                                          child: const PlatformLoader(),
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          child: Html(
                                            data: vm.appState.onboardingState!
                                                .termsAndConditions!.text,
                                          ),
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (vm.appState.clientState?.clientProfile?.user
                          ?.termsAccepted ??
                      false)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SvgPicture.asset(checkIcon),
                              smallHorizontalSizedBox,
                              Text(
                                youHaveAcceptedTerms,
                                style: normalSize14Text(greenHappyColor),
                              )
                            ],
                          ),
                          mediumVerticalSizedBox,
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: MyAfyaHubPrimaryButton(
                              text: okThanksText,
                              buttonKey: okThanksButtonKey,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          )
                        ],
                      ),
                    )
                  else
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CheckBoxComponent(
                            text: acceptTermsText,
                            value: isAgreed,
                            color: AppColors.primaryColor,
                            onChanged: (bool? value) async {
                              setState(() {
                                isAgreed = value!;
                              });
                              if (vm.appState.onboardingState!
                                      .termsAndConditions!.text !=
                                  UNKNOWN) {
                                setState(() {
                                  isAgreed = value!;
                                });
                              }
                            },
                          ),
                        ),
                        smallVerticalSizedBox,

                        // Continue button
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: vm.appState.wait!.isWaitingFor(acceptTermsFlag)
                              ? const PlatformLoader(
                                  color: AppColors.primaryColor,
                                )
                              : MyAfyaHubPrimaryButton(
                                  text: continueString,
                                  borderColor:
                                      termsObject!.text != UNKNOWN && isAgreed
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                  buttonColor:
                                      termsObject.text != UNKNOWN && isAgreed
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                  onPressed: !isAgreed
                                      ? null
                                      : () {
                                          StoreProvider.dispatch(
                                            context,
                                            UpdateUserProfileAction(
                                              termsAccepted: true,
                                            ),
                                          );

                                          StoreProvider.dispatch<AppState>(
                                            context,
                                            // Accept terms and conditions
                                            AcceptTermsAndConditionsAction(
                                              context: context,
                                              shouldPop:
                                                  widget.shouldPop ?? false,
                                            ),
                                          );
                                        },
                                ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
