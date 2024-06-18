import 'package:flutter/material.dart';
import 'section_custom_post.dart';
class CustomPost extends StatelessWidget {
  CustomPost({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
     physics: NeverScrollableScrollPhysics(),
     // physics: NeverScrollableScrollPhysics(),

      itemBuilder: (context , index)  =>Directionality(
        textDirection: TextDirection.rtl,
          child: SectionCustomPost(controller: controller)),
    ) ;
  }
}