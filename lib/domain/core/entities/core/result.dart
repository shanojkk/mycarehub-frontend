import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Result {
  Result({
    required this.name,
    required this.route,
    required this.image,
    required this.description,
    required this.aliases,
    required this.possibleOptions,
    this.shouldUpdateBottomNav = false,
    this.bottomNavIndex,
  });

  List<String> aliases;
  int? bottomNavIndex;
  String description;
  SvgPicture image;
  String name;
  List<PossibleOption> possibleOptions;
  String route;
  bool shouldUpdateBottomNav;
}

class PossibleOption {
  PossibleOption({
    required this.iconUrl,
    required this.description,
    required this.route,
    required this.title,
    this.shouldUpdateBottomNav = false,
    this.bottomNavIndex,
  });

  int? bottomNavIndex;
  String description;
  SvgPicture iconUrl;
  String route;
  bool shouldUpdateBottomNav;
  String title;
}

List<Result> results = <Result>[
  //library
  Result(
    name: libraryTitle,
    route: BWRoutes.home,
    shouldUpdateBottomNav: true,
    bottomNavIndex: BottomNavIndex.library.index,
    image: SvgPicture.asset(libraryImgUrl, height: 80, width: 80),
    description: 'View my library',
    aliases: <String>['lib', 'my library'],
    possibleOptions: <PossibleOption>[
      PossibleOption(
        iconUrl: SvgPicture.asset(libraryImgUrl, height: 30, width: 30),
        description: weeklyDiet,
        route: BWRoutes.home,
        shouldUpdateBottomNav: true,
        bottomNavIndex: BottomNavIndex.library.index,
        title: 'Library',
      ),
      PossibleOption(
        iconUrl: SvgPicture.asset(libraryImgUrl, height: 30, width: 30),
        description: workout,
        route: BWRoutes.home,
        shouldUpdateBottomNav: true,
        bottomNavIndex: BottomNavIndex.library.index,
        title: 'Library',
      ),
    ],
  ),

  //medicine
  Result(
    name: medicine,
    route: BWRoutes.buyMedicine,
    image: SvgPicture.asset(medicationsSearchImgUrl, height: 80, width: 80),
    description: 'Buy medicine',
    aliases: <String>[
      'meds',
      'medication',
      'medicine',
      'my medication',
      'my medicine'
    ],
    possibleOptions: <PossibleOption>[
      PossibleOption(
        iconUrl:
            SvgPicture.asset(medicationsSearchImgUrl, height: 30, width: 30),
        description: prescriptionMedications,
        route: BWRoutes.buyMedicine,
        title: 'Loans',
      ),
    ],
  ),

  //tests
  Result(
    name: tests,
    route: BWRoutes.getTested,
    image: SvgPicture.asset(testSearchImgUrl, height: 80, width: 80),
    description: 'Get Tested',
    aliases: <String>['test', 'tests', 'get test', 'tested'],
    possibleOptions: <PossibleOption>[
      PossibleOption(
        iconUrl: SvgPicture.asset(testSearchImgUrl, height: 30, width: 30),
        description: viewLab,
        route: BWRoutes.getTested,
        title: 'Tests',
      ),
      PossibleOption(
        iconUrl: SvgPicture.asset(testSearchImgUrl, height: 30, width: 30),
        description: getTest,
        route: BWRoutes.getTested,
        title: 'Tests',
      ),
    ],
  ),

  //see a doctor
  Result(
    name: seeDoctor,
    route: BWRoutes.seeDoctor,
    image: SvgPicture.asset(doctorSearchImgUrl, height: 80, width: 80),
    description: 'See a doctor',
    aliases: <String>[
      'doc',
      'doctor',
      'see doctor',
      'talk to doctor',
      'physician'
    ],
    possibleOptions: <PossibleOption>[
      PossibleOption(
        iconUrl: SvgPicture.asset(doctorSearchImgUrl, height: 30, width: 30),
        description: seeDoctor,
        route: BWRoutes.seeDoctor,
        title: 'Doctor',
      ),
    ],
  ),

  //help center
  Result(
    name: helpCenter,
    route: BWRoutes.helpCenter,
    image: SvgPicture.asset(helpSearchImgUrl, height: 80, width: 80),
    description: 'Help center',
    aliases: <String>[
      'help',
      'help center',
      'center',
      'need help',
      'FAQS',
      'faqs',
      'FAQ',
      'faq'
    ],
    possibleOptions: <PossibleOption>[
      PossibleOption(
        iconUrl: SvgPicture.asset(helpSearchImgUrl, height: 50, width: 50),
        description: getHelp,
        route: BWRoutes.helpCenter,
        title: 'Help Center',
      ),
    ],
  ),
];
