import 'package:rxdart/rxdart.dart';
import 'package:app_wrapper/app_wrapper.dart';

class EndPointsContextSubject {
  factory EndPointsContextSubject() {
    return _singleton;
  }

  EndPointsContextSubject._internal();

  /// title
  BehaviorSubject<List<AppContext>> contexts =
      BehaviorSubject<List<AppContext>>();

  static final EndPointsContextSubject _singleton =
      EndPointsContextSubject._internal();
}
