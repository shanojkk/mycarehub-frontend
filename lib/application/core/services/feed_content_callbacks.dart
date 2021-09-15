import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import 'package:user_feed/user_feed.dart';

/// returns actions that will be performed upon interactions with the feed
Map<String, Function> getFeedContentCallbacks({required BuildContext context}) {
  return <String, Function>{
    kGetMedicine: () => Navigator.of(context).pushNamed(BWRoutes.buyMedicine),
    kVerifyEmail: () => Navigator.of(context).pushNamed(BWRoutes.contactInfo),
    kGetTest: () => Navigator.pushNamed(context, BWRoutes.getTested),
    kGetConsultation: () => Navigator.pushNamed(context, BWRoutes.seeDoctor),
  };
}
