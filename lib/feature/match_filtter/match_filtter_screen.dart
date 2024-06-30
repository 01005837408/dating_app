import 'package:dating_app/core/model/match_filtter_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/feature/match_filtter/widgets/advanced_filtter_listview.dart';
import 'package:dating_app/feature/match_filtter/widgets/advanced_text_with_divider.dart';
import 'package:dating_app/feature/match_filtter/widgets/done_container_text.dart';
import 'package:dating_app/feature/match_filtter/widgets/match_filtter_listview.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class MatchFiltter extends StatelessWidget {
  MatchFiltter({super.key});
  final List<MatchFiltterModel> matchList = [
    MatchFiltterModel(title: ConstText.search, subtitle: ConstText.women),
    MatchFiltterModel(
      title: ConstText.age,
      subtitle: '18',
    ),
    MatchFiltterModel(
      title: ConstText.liveIn,
      subtitle: ConstText.egypt,
    ),
  ];

  final List<AdvancedMatchFiltterModel> advancedMatchList = [
    AdvancedMatchFiltterModel(
      title: ConstText.look,
    ),
    AdvancedMatchFiltterModel(
      title: ConstText.lifeStyle,
    ),
    AdvancedMatchFiltterModel(
      title: ConstText.knowlege,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
