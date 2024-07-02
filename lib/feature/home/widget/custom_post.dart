import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/api/api_user.dart';
import 'package:dating_app/core/modal/sign_up_user_modal.dart';
import 'package:flutter/material.dart';
import 'section_custom_post.dart';
class CustomPost extends StatefulWidget {
  CustomPost({super.key});

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  PageController controller = PageController();


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: UserApi.getAllUser(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasData){
          QuerySnapshot<Map<String, dynamic>> querySnapshot =snapshot.data as QuerySnapshot<Map<String, dynamic>>;
          List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: docs.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context , index)  =>Directionality(
              textDirection: TextDirection.rtl,
                child: SectionCustomPost(
                  
                  controller: controller,
              signUpUserModal: SignUpUserModal(
                fName: docs[index]['fName'],
                lName: docs[index]['lName'],
                email: docs[index]['email'],
               id: docs[index]['id'],
              ))
          ),
          );
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      }
      
    );
  }
}
