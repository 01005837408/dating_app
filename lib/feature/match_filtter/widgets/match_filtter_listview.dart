import 'package:dating_app/core/model/match_filtter_model.dart';
import 'package:dating_app/feature/match_filtter/widgets/match_filtter_listview_item.dart';
import 'package:flutter/material.dart';

class MatchFiltterListView extends StatelessWidget {
  const MatchFiltterListView({
    super.key,
    required this.matchList,
  });

  final List<MatchFiltterModel> matchList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: matchList.length,
        itemBuilder: (context, index) => MatchFiltterListItem(
          matchList: matchList,
          index: index,
        ),
      ),
    );
  }
}
