import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/app_bootstrap.dart';
import 'package:pro_health_360/domain/core/value_objects/app_context_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appBootStrap(testAppContexts);
}
