import 'package:facebook_app_events/facebook_app_events.dart';

class BeWellFacebookEvents {
  factory BeWellFacebookEvents() {
    return _singleton;
  }

  BeWellFacebookEvents._internal();

  final FacebookAppEvents logger = FacebookAppEvents();

  static final BeWellFacebookEvents _singleton =
      BeWellFacebookEvents._internal();
}
