// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/can_record_mood_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_item.dart';
import 'package:myafyahub/presentation/health_diary/widgets/random_quote_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

class MoodSelectionWidget extends StatefulWidget {
  const MoodSelectionWidget();

  @override
  _MoodSelectionWidgetState createState() => _MoodSelectionWidgetState();
}

class _MoodSelectionWidgetState extends State<MoodSelectionWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        CanRecordMoodAction(
          context: context,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) {
        return AppStateViewModel.fromStore(store);
      },
      builder: (BuildContext context, AppStateViewModel vm) {
        final bool canRecordMood =
            vm.appState.homeState?.canRecordMood ?? false;

        if (vm.appState.wait!.isWaitingFor(canRecordMoodFlag)) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            child: const SILPlatformLoader(),
          );
        } else {
          return canRecordMood
              ? moodWidget(context)
              : const RandomQuoteWidget();
        }
      },
    );
  }
}

Widget moodWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.srcOver,
        ),
        fit: BoxFit.cover,
        image: const AssetImage(moodSelectionBackgroundUrl),
      ),
    ),
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        smallVerticalSizedBox,
        StoreConnector<AppState, ClientProfileViewModel>(
          converter: (Store<AppState> store) =>
              ClientProfileViewModel.fromStore(store),
          builder: (
            BuildContext context,
            ClientProfileViewModel vm,
          ) {
            final String? lastName = vm.clientState?.user?.lastName;
            return Text(
              howAreYouFeelingTodayText(lastName ?? UNKNOWN),
              style: TextThemes.boldSize24Text().copyWith(color: white),
            );
          },
        ),
        mediumVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MoodItem(
              key: excitedMoodKey,
              moodIcon: excitedIconSvgPath,
              moodText: excitedString,
              onTap: () {
                Navigator.of(context).pushNamed(
                  BWRoutes.moodFeedbackPage,
                  arguments: MoodType.Excited,
                );
              },
            ),
            MoodItem(
              key: happyMoodKey,
              moodIcon: happyIconSvgPath,
              moodText: happyString,
              onTap: () {
                Navigator.of(context).pushNamed(
                  BWRoutes.moodFeedbackPage,
                  arguments: MoodType.Happy,
                );
              },
            ),
            MoodItem(
              key: mehMoodKey,
              moodIcon: mehIconSvgPath,
              moodText: mehString,
              onTap: () {
                Navigator.of(context).pushNamed(
                  BWRoutes.moodFeedbackPage,
                  arguments: MoodType.Meh,
                );
              },
            ),
            MoodItem(
              key: sadMoodKey,
              moodIcon: sadIconSvgPath,
              moodText: sadString,
              onTap: () {
                Navigator.of(context).pushNamed(
                  BWRoutes.moodFeedbackPage,
                  arguments: MoodType.Sad,
                );
              },
            ),
            MoodItem(
              key: verySadMoodKey,
              moodIcon: verySadIconSvgPath,
              moodText: verySadString,
              onTap: () {
                Navigator.of(context).pushNamed(
                  BWRoutes.moodFeedbackPage,
                  arguments: MoodType.VerySad,
                );
              },
            ),
          ],
        )
      ],
    ),
  );
}
