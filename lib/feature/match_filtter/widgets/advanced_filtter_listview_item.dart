import 'package:dating_app/core/model/match_filtter_model.dart';
import 'package:flutter/material.dart';

class AdvancedFiltterListItem extends StatelessWidget {
  const AdvancedFiltterListItem({
    super.key,
    required this.advancedMatchList,
    required this.index,
  });
  final List<AdvancedMatchFiltterModel> advancedMatchList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        advancedMatchList[index].title,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
