import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/entities/core/question_choice.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool_answer.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool_answers_list.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';

class ScreeningToolQuestionWidget extends StatefulWidget {
  const ScreeningToolQuestionWidget({
    required this.screeningTool,
  });

  final ScreeningTool screeningTool;

  @override
  State<ScreeningToolQuestionWidget> createState() =>
      _ScreeningToolQuestionWidgetState();
}

class _ScreeningToolQuestionWidgetState
    extends State<ScreeningToolQuestionWidget> {
  final Map<String, String> answers = <String, String>{};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.screeningTool.questionnaire?.screeningQuestions?.length,
      itemBuilder: (BuildContext context, int index) {
        // choices
        final List<QuestionChoice?>? choices = widget
            .screeningTool.questionnaire?.screeningQuestions?[index]?.choices;

        // sequence number
        final int sequenceNumber = widget.screeningTool.questionnaire
                ?.screeningQuestions?[index]?.sequence ??
            0;

        final List<CustomChipWidget> symptomWidgets = <CustomChipWidget>[];

        // question text
        final String questionText =
            '$sequenceNumber. ${widget.screeningTool.questionnaire?.screeningQuestions?[index]?.questionText!} ';

        // question id
        final String questionId =
            '${widget.screeningTool.questionnaire?.screeningQuestions?[index]?.id!}';

        if (choices?.isNotEmpty ?? false) {
          for (final QuestionChoice? choice in choices!) {
            final bool isSelected = answers[questionId] == choice?.choice;

            symptomWidgets.add(
              CustomChipWidget(
                title: choice?.value ?? '',
                gestureKey: Key('$sequenceNumber${choice?.value}'),
                isSelected: isSelected,
                onTap: () {
                  answers.addAll(
                    <String, String>{questionId: '${choice?.choice}'},
                  );
                  final List<ScreeningToolAnswer> screeningAnswers =
                      <ScreeningToolAnswer>[];
                  answers.forEach((String key, String value) {
                    screeningAnswers.add(
                      ScreeningToolAnswer(questionId: key, response: value),
                    );
                  });
                  StoreProvider.dispatch(
                    context,
                    UpdateScreeningToolsState(
                      responses: ScreeningToolAnswersList(
                        answersList: screeningAnswers,
                      ),
                    ),
                  );
                  setState(() {});
                },
              ),
            );
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            smallVerticalSizedBox,
            Text(
              questionText,
              style: normalSize14Text(AppColors.greyTextColor),
            ),
            smallVerticalSizedBox,
            Wrap(spacing: 12.0, runSpacing: 12.0, children: symptomWidgets),
            smallVerticalSizedBox,
          ],
        );
      },
    );
  }
}
