import 'package:dating_app/core/model/match_filtter_model.dart';
import 'package:flutter/material.dart';

class MatchFiltterListItem extends StatelessWidget {
  const MatchFiltterListItem(
      {super.key, required this.index, required this.matchList});
  final List<MatchFiltterModel> matchList;

  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        matchList[index].title,
        style: const TextStyle(
          fontSize: 27,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        matchList[index].subtitle ?? '',
        style: const TextStyle(
            fontSize: 29, color: Colors.white, fontWeight: FontWeight.w900),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          )),
    );
  }
}
