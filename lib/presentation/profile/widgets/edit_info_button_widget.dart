// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class EditInformationButtonWidget extends StatelessWidget {
  ///[EditInformationButtonWidget] used to edit information in user profile
  const EditInformationButtonWidget({
    required this.editInformationItem,
    this.submitFunction,
    this.editBtnKey,
    this.vm,
  });

  final void Function(EditInformationItem editInformationItem)? submitFunction;
  final Key? editBtnKey;
  final EditInformationItem editInformationItem;
  final ClientProfileViewModel? vm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: editBtnKey,
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.editInformationPage,
          arguments: <String, dynamic>{
            'editInformationItem': editInformationItem,
            'onSubmit': submitFunction,
            'vm': vm
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          editString,
          textAlign: TextAlign.center,
          style: normalSize14Text(AppColors.whiteColor),
        ),
      ),
    );
  }
}
