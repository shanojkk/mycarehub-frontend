// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:unicons/unicons.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({super.key, this.onChanged});

  final void Function(bool)? onChanged;

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  bool groupsSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: consentText,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                key: termsAndConditionsKey,
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.termsAndConditions, arguments: true),
                child: InformationListCard(
                  leadingIcon: const Icon(
                    UniconsLine.file_lock_alt,
                    size: 32,
                    color: AppColors.primaryColor,
                  ),
                  title: Text(
                    portalTermsText,
                    style: normalSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                  body: Text(
                    viewTermsText,
                    style: normalSize14Text(
                      Colors.grey,
                    ),
                  ),
                ),
              ),
              smallVerticalSizedBox,
              GestureDetector(
                key: optOutInfoItemKey,
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.consentConfirmationPage),
                child: InformationListCard(
                  leadingIcon: const Icon(
                    UniconsLine.file_lock_alt,
                    size: 32,
                    color: AppColors.primaryColor,
                  ),
                  title: Text(
                    optOut,
                    style: normalSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                  body: Text(
                    optOutOfMyCareHubString,
                    style: normalSize14Text(
                      Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
