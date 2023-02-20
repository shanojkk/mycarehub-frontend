import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/home/widgets/bottom_nav_bar.dart';

class CommunitiesListPage extends StatelessWidget {
  const CommunitiesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Communities'),
      body: Container(),
      bottomNavigationBar: const BottomNavBar(bottomNavIndex: 2),
    );
  }
}
