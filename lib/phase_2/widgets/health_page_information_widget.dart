import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class HealthPageInformationWidget extends StatelessWidget {
  const HealthPageInformationWidget({
    Key? key,
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.userPhoneNumber,
    required this.hospitalName,
  }) : super(key: key);

  final User? user;
  final String firstName;
  final String lastName;
  final String userPhoneNumber;
  final String hospitalName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(13.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(0.1),
                ),
                child: Center(
                  child: Text(
                    extractNamesInitials(
                      name: getDisplayName(user),
                    ),
                    style: boldSize20Text(
                      AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              size15HorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$firstName $lastName',
                    style: boldSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  Text(
                    userPhoneNumber,
                    style: normalSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    hospitalName,
                    style: normalSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                  verySmallVerticalSizedBox,
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              yourCurrentHospitalDescription(hospitalName),
              style: normalSize14Text(
                AppColors.unSelectedReactionIconColor,
              ),
            ),
          ),
          smallVerticalSizedBox,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: MyAfyaHubPrimaryButton(
              onPressed: () {},
              text: changeMyFacility,
            ),
          )
        ],
      ),
    );
  }
}
