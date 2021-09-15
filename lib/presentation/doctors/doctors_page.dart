import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui_components/coming_soon_page.dart';
import 'package:shared_ui_components/small_appbar.dart';

class SeeDoctorLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SILSmallAppBar(
        title: seeDoctorTitle,
        backRoute: BWRoutes.home,
      ),
      body: SILComingSoonPage(
          title: seeDoctorTitle,
          svgPath: doctorLandingPageImgUrl,
          description: seeDoctorCopy,
          comingSoonText: seeDoctorComingSoonText),
    );
  }
}
