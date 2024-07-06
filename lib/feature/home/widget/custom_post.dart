import 'package:flutter/material.dart';
import 'section_custom_post.dart';

class CustomPost extends StatefulWidget {
  const CustomPost({super.key});

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Directionality(
          textDirection: TextDirection.rtl,
          child: SectionCustomPost(
            controller: controller,
            // signUpUserModal: SignUpUserModal(
            //   fName: docs[index]['fName'],
            //   lName: docs[index]['lName'],
            //   email: docs[index]['email'],
            //  id: docs[index]['id'],
            // ),
          )),
    );
  }
}
