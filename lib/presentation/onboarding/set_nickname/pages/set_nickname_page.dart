// Dart imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_content_action.dart';
import 'package:pro_health_360/application/redux/actions/update_onboarding_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/set_nickname_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/constants.dart';
import 'package:pro_health_360/infrastructure/connectivity/connectivity_interface.dart';
import 'package:pro_health_360/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:pro_health_360/presentation/content/widgets/mini_content_widget.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

class SetNickNamePage extends StatefulWidget {
  SetNickNamePage({ConnectivityChecker? connectivityStatus})
      : connectivityStatus = connectivityStatus ?? MobileConnectivityChecker();

  final ConnectivityChecker connectivityStatus;
  @override
  _SetNickNamePageState createState() => _SetNickNamePageState();
}

class _SetNickNamePageState extends State<SetNickNamePage> {
  String? nickName;
  TextEditingController userNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 4;
    return StoreConnector<AppState, SetNicknameViewModel>(
      converter: (Store<AppState> store) =>
          SetNicknameViewModel.fromStore(store.state),
      onInit: (Store<AppState> store) async {
        StoreProvider.dispatch<AppState>(
          context,
          FetchContentAction(
            context: context,
            limit: 3,
            category: ContentCategory(id: 3),
          ),
        );
      },
      builder: (BuildContext context, SetNicknameViewModel vm) {
        final bool waitingForFlag = vm.wait!.isWaitingFor(setNickNameFlag);
        final List<Content?>? feedItems = vm.feedContentState?.contentItems;
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          body: SizedBox.expand(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: sizedBoxHeight,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mediumVerticalSizedBox,
                          Text(
                            setNickNamePageTitle(context: context),
                            style: boldSize30Text(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            congratulationsPageDescription,
                            style: lightSize16Text(Colors.grey),
                          ),
                          smallVerticalSizedBox,
                        ],
                      ),
                      smallVerticalSizedBox,
                      SizedBox(
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      nickNameString,
                                      style: boldSize14Text(
                                        AppColors.greyTextColor,
                                      ),
                                    ),
                                  ),
                                  verySmallVerticalSizedBox,
                                  CustomTextField(
                                    formFieldKey: nameInputKey,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    borderColor: Colors.grey[200],
                                    maxLines: 1,
                                    keyboardType: TextInputType.name,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return nameInputValidateString;
                                      } else if (!nameRegexString
                                          .hasMatch(value)) {
                                        return errorNicknameInputString;
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (String val) {
                                      setState(() {
                                        nickName = val;
                                      });
                                    },
                                  ),
                                  if (vm.wait?.isWaitingFor(
                                        fetchContentFlag,
                                      ) ??
                                      false)
                                    Container(
                                      height: 200,
                                      padding: const EdgeInsets.all(20),
                                      child: const PlatformLoader(),
                                    ),
                                  if (vm.feedContentState
                                          ?.errorFetchingContent ??
                                      false)
                                    GenericErrorWidget(
                                      actionKey: helpNoDataWidgetKey,
                                      recoverCallback: () async {
                                        StoreProvider.dispatch<AppState>(
                                          context,
                                          FetchContentAction(
                                            context: context,
                                            limit: 3,
                                            category: ContentCategory(id: 3),
                                          ),
                                        );
                                      },
                                      messageBody: const <TextSpan>[
                                        TextSpan(
                                          text: messageBodyGenericErrorWidget,
                                        )
                                      ],
                                    ),
                                  if (feedItems != null && feedItems.isNotEmpty)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            veryLargeVerticalSizedBox,
                                            smallVerticalSizedBox,
                                            Text(
                                              importantInformationString,
                                              style: TextThemes.boldSize16Text(
                                                AppColors.secondaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 250,
                                              child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: feedItems.length,
                                                itemBuilder: (
                                                  BuildContext context,
                                                  int index,
                                                ) {
                                                  final Content? currentLink =
                                                      feedItems.elementAt(
                                                    index,
                                                  );

                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 5,
                                                    ),
                                                    child: MiniContentWidget(
                                                      contentDetails:
                                                          currentLink,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox()
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 52,
            child: waitingForFlag
                ? const PlatformLoader()
                : MyAfyaHubPrimaryButton(
                    buttonKey: continueKey,
                    onPressed: () async {
                      final bool hasConnection =
                          await widget.connectivityStatus.checkConnection();
                      final bool? isFormValid =
                          _formKey.currentState?.validate();
                      if (!hasConnection) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(noInternetConnection)),
                        );
                        return;
                      }
                      if (isFormValid != null &&
                          isFormValid &&
                          nickName != null) {
                        StoreProvider.dispatch<AppState>(
                          context,
                          UpdateOnboardingStateAction(nickName: nickName),
                        );
                        setUserNickname(context: context);
                      }
                    },
                    buttonColor:
                        waitingForFlag ? Colors.grey : AppColors.primaryColor,
                    borderColor:
                        waitingForFlag ? Colors.grey : AppColors.primaryColor,
                    text: continueString,
                  ),
          ),
        );
      },
    );
  }
}
