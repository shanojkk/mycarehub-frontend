// Flutter imports:
// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

class EditInformationPage extends StatefulWidget {
  ///[EditInformationPage] renders a form with inputs and a submit button
  ///Form can only be submitted when at least one input is altered
  const EditInformationPage({
    required this.editInformationItem,
    required this.onSubmit,
  });

  final EditInformationItem editInformationItem;
  final void Function(EditInformationItem editInformationItem) onSubmit;

  @override
  State<EditInformationPage> createState() => _EditInformationPageState();
}

class _EditInformationPageState extends State<EditInformationPage> {
  bool formIsEdited = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = father;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: editInfoTitle(widget.editInformationItem.title),
        leadingWidget: SvgPicture.asset(
          closeIconSvg,
          color: AppColors.blueChillColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.editInformationItem.title,
                      style: boldSize16Text(
                        AppColors.secondaryColor,
                      ),
                    ),
                    verySmallVerticalSizedBox,
                    if (widget.editInformationItem.description != null)
                      Text(
                        widget.editInformationItem.description!,
                        style: normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    smallVerticalSizedBox,

                    ///Generates a list with all the input widgets
                    ...List<Widget>.generate(
                      widget
                          .editInformationItem.editInformationInputItem.length,
                      (int index) {
                        final EditInformationInputItem
                            editInformationInputItem = widget
                                .editInformationItem.editInformationInputItem
                                .elementAt(index);

                        if (editInformationInputItem.inputType ==
                            EditInformationInputType.Text) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (index > 0) smallVerticalSizedBox,
                              Text(
                                editInformationInputItem.fieldName,
                                style: boldSize14Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              smallVerticalSizedBox,
                              CustomTextField(
                                formFieldKey: ValueKey<String>('$index'),
                                borderColor: Colors.grey[200],
                                keyboardType: TextInputType.text,
                                controller:
                                    editInformationInputItem.inputController,
                                hintText: editInformationInputItem.hintText,
                                autovalidateMode: AutovalidateMode.disabled,
                                onChanged: (String? value) {
                                  ///So that it only runs once when an input is modified
                                  if (!formIsEdited) {
                                    setState(() {
                                      formIsEdited = true;
                                    });
                                  }
                                },
                              ),

                              //Add spacing below last item to ensure it is visible with the bottom button
                              if (index ==
                                  widget.editInformationItem
                                          .editInformationInputItem.length -
                                      1)
                                const SizedBox(height: 65),
                            ],
                          );
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            if (index > 0) smallVerticalSizedBox,
                            Text(
                              editInformationInputItem.fieldName,
                              style: boldSize14Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                            smallVerticalSizedBox,
                            EditInformationDropDown(
                              value: dropdownValue,
                              items:
                                  editInformationInputItem.dropDownOptionList!,
                              onChange: (String? value) {
                                if (value != null) {
                                  editInformationInputItem
                                      .inputController.text = value;
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                }

                                ///So that it only runs once when an input is modified
                                if (!formIsEdited) {
                                  setState(() {
                                    formIsEdited = true;
                                  });
                                }
                              },
                            ),
                            //Add spacing below last item to ensure it is visible with the bottom button
                            if (index ==
                                widget.editInformationItem
                                        .editInformationInputItem.length -
                                    1)
                              const SizedBox(height: 65),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            StoreConnector<AppState, AppStateViewModel>(
              converter: (Store<AppState> store) =>
                  AppStateViewModel.fromStore(store),
              builder: (BuildContext context, AppStateViewModel vm) {
                return Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: (vm.appState.wait!.isWaitingFor(editInformationFlag))
                        ? const SILPlatformLoader()
                        : MyAfyaHubPrimaryButton(
                            buttonKey: editInfoSaveBtn,
                            onPressed: formIsEdited
                                ? () {
                                    widget.onSubmit(widget.editInformationItem);
                                  }
                                : null,
                            buttonColor: formIsEdited
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            borderColor: formIsEdited
                                ? AppColors.secondaryColor
                                : Colors.transparent,
                            text: toBeginningOfSentenceCase(saveString),
                          ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
