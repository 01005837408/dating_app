import 'package:dating_app/core/model/match_filtter_model.dart';
import 'package:dating_app/feature/match_filtter/widgets/advanced_filtter_listview_item.dart';
import 'package:flutter/material.dart';

class AdvancedFiltterListView extends StatelessWidget {
  const AdvancedFiltterListView({super.key, required this.advancedMatchList});
  final List<AdvancedMatchFiltterModel> advancedMatchList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => AdvancedFiltterListItem(
                advancedMatchList: advancedMatchList,
                index: index,
              )),
    );
  }
}
