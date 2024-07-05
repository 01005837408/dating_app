import 'package:dating_app/core/model/match_filtter_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/feature/match_filtter/widgets/advanced_filtter_listview.dart';
import 'package:dating_app/feature/match_filtter/widgets/advanced_text_with_divider.dart';
import 'package:dating_app/feature/match_filtter/widgets/done_container_text.dart';
import 'package:dating_app/feature/match_filtter/widgets/match_filtter_listview.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MatchFiltter extends StatelessWidget {
  const MatchFiltter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MatchFiltterModel> matchList = [
      MatchFiltterModel(
        title: S.of(context).search,
        subtitle: S.of(context).women,
      ),
      MatchFiltterModel(
        title: S.of(context).age,
        subtitle: '18',
      ),
      MatchFiltterModel(
        title: S.of(context).liveIn,
        subtitle: S.of(context).egypt,
      ),
    ];
    final List<AdvancedMatchFiltterModel> advancedMatchList = [
      AdvancedMatchFiltterModel(
        title: S.of(context).look,
      ),
      AdvancedMatchFiltterModel(
        title: S.of(context).lifeStyle,
      ),
      AdvancedMatchFiltterModel(
        title: S.of(context).knowlege,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                widget: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColor.kPrimaryColor,
                text: ConstText.matchFiltter,
              ),
              const DoneContainerText(),
              MatchFiltterListView(matchList: matchList),
              const AdvancedTextWithDivider(),
              AdvancedFiltterListView(advancedMatchList: advancedMatchList),
            ],
          ),
        ),
      ),
    );
  }
}
