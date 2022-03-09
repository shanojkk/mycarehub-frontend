import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/communities/accept_decline_communities_invite_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/spaces.dart';

class AcceptGroupInvitesPage extends StatefulWidget {
  const AcceptGroupInvitesPage({
    required this.groupId,
    required this.groupName,
    required this.numberOfMembers,
  });
  final String groupName;
  final String groupId;
  final int numberOfMembers;

  @override
  State<AcceptGroupInvitesPage> createState() => _AcceptGroupInvitesPageState();
}

class _AcceptGroupInvitesPageState extends State<AcceptGroupInvitesPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.groupName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(acceptInvitesImage),
              Text(
                widget.groupName,
                style: boldSize20Text(AppColors.blackColor.withOpacity(0.8)),
              ),
              smallVerticalSizedBox,
              Text(
                '${widget.numberOfMembers} members',
                style: normalSize16Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              Text(
                groupInviteDescription(widget.groupName),
                style: normalSize17Text(AppColors.greyTextColor),
                textAlign: TextAlign.center,
              ),
              largeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                child: loading
                    ? const PlatformLoader()
                    : MyAfyaHubPrimaryButton(
                        text: joinGroup,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          await StoreProvider.dispatch(
                            context,
                            AcceptDeclineCommunitiesInviteAction(
                              hasAcceptedInvite: true,
                              communityID: widget.groupId,
                              context: context,
                            ),
                          );
                        },
                      ),
              ),
              mediumVerticalSizedBox,
              if (!loading)
                SizedBox(
                  width: double.infinity,
                  child: MyAfyaHubPrimaryButton(
                    borderColor: Colors.transparent,
                    buttonColor: AppColors.primaryColor.withOpacity(0.1),
                    textColor: AppColors.lightRedTextColor,
                    text: declineInvite,
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await StoreProvider.dispatch(
                        context,
                        AcceptDeclineCommunitiesInviteAction(
                          hasAcceptedInvite: false,
                          communityID: widget.groupId,
                          context: context,
                        ),
                      );
                    },
                  ),
                ),
              mediumVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
