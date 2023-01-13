import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/medical_data/fetch_next_refill_data_action.dart';
import 'package:pro_health_360/application/redux/actions/medical_data/fetch_viral_load_data_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/client_profile_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_node.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/core/widgets/no_connection_widget.dart';
import 'package:pro_health_360/presentation/my_health/widgets/profile_health_details_widget.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/my_health_timeline.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class MyHealthPage extends StatefulWidget {
  const MyHealthPage({this.graphQlClient});

  final IGraphQlClient? graphQlClient;

  @override
  State<MyHealthPage> createState() => _MyHealthPageState();
}

class _MyHealthPageState extends State<MyHealthPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (shouldInputPIN(context)) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.pinInputPage,
        );
      }
    });
  }

  IGraphQlClient getCustomClient() {
    if (widget.graphQlClient != null) {
      return widget.graphQlClient!;
    } else {
      final List<AppContext> contexts = AppWrapperBase.of(context)!.appContexts;
      final AppSetupData appSetupData = getAppSetupData(contexts.last);
      final String graphqlEndpoint = appSetupData.clinicalEndpoint;
      final String refreshTokenEndpoint =
          appSetupData.customContext?.refreshTokenEndpoint ?? '';

      final String idToken =
          StoreProvider.state<AppState>(context)?.credentials?.idToken ?? '';
      final String userID =
          StoreProvider.state<AppState>(context)?.clientState?.user?.userId ??
              '';

      return CustomClient(
        idToken,
        graphqlEndpoint,
        context: context,
        refreshTokenEndpoint: refreshTokenEndpoint,
        userID: userID,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: 3,
      appBar: const CustomAppBar(
        title: myHealthPageTitle,
        showBackButton: false,
        bottomNavIndex: 3,
      ),
      body: StoreConnector<AppState, ClientProfileViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchViralLoadDataAction(httpClient: getCustomClient()),
          );

          store.dispatch(
            FetchNextRefillDataAction(
              httpClient: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            ClientProfileViewModel.fromStore(store),
        builder: (BuildContext context, ClientProfileViewModel vm) {
          final User? userProfileState = vm.clientState?.user;
          final String firstName = userProfileState?.firstName ?? '';
          final String lastName = userProfileState?.lastName ?? '';
          final List<ViralLoadNode?> viralLoadData =
              vm.clientState?.viralLoadData?.edges ?? <ViralLoadNode>[];

          final String nextRefill =
              vm.clientState?.nextRefillData?.nextRefill ?? '';
          final Map<String, String> nextRefillDate =
              extractNextRefillDate(nextRefill);

          if (!(vm.connectivityState?.isConnected ?? false)) {
            return const NoConnectionWidget();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.userProfilePage,
                          );
                        },
                        child:
                            //TODO(byron): Return this during phase 2 implementation
                            // HealthPageInformationWidget(
                            //   user: userProfileState,
                            //   firstName: firstName,
                            //   lastName: lastName,
                            //   userPhoneNumber: userPhoneNumber,
                            //   hospitalName: hospitalName,
                            // ),
                            InformationListCard(
                          title: Text(
                            myHealthPageProfile,
                            style: boldSize16Text(AppColors.secondaryColor),
                          ),
                          alternateLeadingIcon: Container(
                            padding: const EdgeInsets.all(13.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor.withOpacity(0.1),
                            ),
                            child: Center(
                              child: Text(
                                extractNamesInitials(
                                  name: getDisplayName(userProfileState),
                                ),
                                style: boldSize20Text(
                                  AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          body: Text(
                            '$firstName $lastName',
                            style: normalSize14Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ),
                      ),
                      size15VerticalSizedBox,
                      if (vm.wait!.isWaitingFor(fetchViralLoadDataFlag))
                        Container(
                          height: 300,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          child: const PlatformLoader(),
                        ),
                      if (!vm.wait!.isWaitingFor(fetchViralLoadDataFlag) &&
                          (viralLoadData.isNotEmpty || nextRefill.isNotEmpty))
                        Row(
                          children: <Widget>[
                            if (viralLoadData.isNotEmpty)
                              Expanded(
                                child: ProfileHealthDetailsWidget(
                                  svgPath: viralLoadIcon,
                                  title: myHealthViralLoad,
                                  description:
                                      viralLoadData.first?.node?.valueString ??
                                          '',
                                  descriptionSubScript:
                                      myHealthViralLoadReadingUnit,
                                ),
                              ),
                            if (viralLoadData.isNotEmpty)
                              smallHorizontalSizedBox,
                            if (nextRefill.isNotEmpty)
                              Expanded(
                                child: ProfileHealthDetailsWidget(
                                  svgPath: nextRefillIcon,
                                  title: myHealthNextRefill,
                                  description: nextRefillDate['day'] ?? '',
                                  descriptionSubScript:
                                      nextRefillDate['month'] ?? '',
                                ),
                              ),
                            if (viralLoadData.isEmpty) smallHorizontalSizedBox,
                            if (nextRefill.isEmpty || viralLoadData.isEmpty)
                              const Spacer(),
                          ],
                        ),
                      size15VerticalSizedBox,
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.myHealthDiaryPage,
                              ),
                              child: InformationListCard(
                                title: Text(
                                  myHealthPageHealthDiary,
                                  style: normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                                alternateLeadingIcon: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    healthDiaryIcon,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          smallHorizontalSizedBox,
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.appointmentsPage,
                              ),
                              child: InformationListCard(
                                title: Text(
                                  myHealthPageAppointments,
                                  style: normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                                alternateLeadingIcon: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    appointmentIcon,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      size15VerticalSizedBox,
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.medicalData,
                              ),
                              child: InformationListCard(
                                title: Text(
                                  medicalDataTitle,
                                  style: normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                                alternateLeadingIcon: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    medicalDataIcon,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          smallHorizontalSizedBox,
                        ],
                      ),
                      MyHealthTimeline(
                        graphQlClient: getCustomClient(),
                        showMore: true,
                        showMoreCallback: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.myHealthTimeline);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
