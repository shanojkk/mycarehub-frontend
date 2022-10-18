// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/logout_button.dart';
import 'package:pro_health_360/presentation/profile/hotline/widgets/hotline_widget.dart';
import 'package:pro_health_360/presentation/profile/widgets/user_details_card_widget.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final TargetPlatform platform = Theme.of(context).platform;
    return Scaffold(
      appBar: const CustomAppBar(title: myHealthPageProfile),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  largeVerticalSizedBox,
                  const UserDetailsCard(),
                  largeVerticalSizedBox,
                  ...List<Widget>.generate(userProfileItems.length,
                      (int index) {
                    final String iconPath =
                        userProfileItems.elementAt(index).iconAssetPath;
                    final String title =
                        userProfileItems.elementAt(index).title;
                    final String routeName =
                        userProfileItems.elementAt(index).route;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GestureDetector(
                        onTap: () {
                          if (routeName.isNotEmpty) {
                            Navigator.pushNamed(context, routeName);
                          }
                        },
                        child: InformationListCard(
                          title: Text(
                            title,
                            maxLines: 2,
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          iconBackgroundColor: AppColors.listCardColor,
                          leadingIcon: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.listCardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              iconPath,
                              width: 20,
                              height: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  mediumVerticalSizedBox,
                  const HotlineWidget(),
                  mediumVerticalSizedBox,
                  const SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: LogoutButton(),
                  ),
                  const SizedBox(height: 20),
                  if (platform != TargetPlatform.iOS)
                    Center(
                      child: Text(
                        '$appVersionString $APPVERSION',
                        style: normalSize9Text(Colors.grey),
                      ),
                    ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
