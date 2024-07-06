
import 'dart:io';

import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/profile_screen/widgets/Profile_appBar.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_body.dart';
import 'package:dating_app/feature/settings_profile/settings_Screen_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/api/api.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
// ChatUser user ;
   ImagePicker _picker = ImagePicker();

  XFile? _image;
   Future<void> _pickImage(ImageSource source) async {
     try {
       final pickedImage = await _picker.pickImage(source: source);
       setState(() {
         _image = pickedImage;
       });
       Navigator.of(context).pop(); // Close the modal bottom sheet
     } catch (e) {
       print(e);
       Navigator.of(context)
           .pop(); // Close the modal bottom sheet in case of error
     }
   }
   void _showImageSourceActionSheet(BuildContext context) {
     showModalBottomSheet(
       context: context,
       builder: (BuildContext context) {
         return SafeArea(
           child: Wrap(
             children: <Widget>[
               ListTile(
                   leading: Icon(Icons.photo_library),
                   title: Text('Photo Library'),
                   onTap: () {
                     _pickImage(ImageSource.gallery);
                     Api.updateProfilePicture(File(_image!.path));
                     setState(() {});
                   }),
               ListTile(
                   leading: Icon(Icons.photo_camera),
                   title: Text('Camera'),
                   onTap: () {
                     _pickImage(ImageSource.camera);
                     Api.updateProfilePicture(File(_image!.path));
                     setState(() {});
                   }),
             ],
           ),
         );
       },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
       const Column(children: [
         ProfileAppBar(height: 130,),

         ProfileBody(),
       ],),
            Positioned(
              top: 80.h,
              left: MediaQuery.of(context).size.width/3.3,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path))
                        : NetworkImage(
                      "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                    ) as ImageProvider,
                    radius: 80,

                  ),
                  Positioned(
                    right: 5,
                    top: 115,
                    child: InkWell(
                      onTap: () => _showImageSourceActionSheet(context),

                      child: const CircleAvatar(

                        radius: 18,
                          backgroundColor: Color(0xFFEDB2C2),
                          child: Icon(Icons.edit_calendar,color: Color(0xFFFE3B72),size: 18,)),
                    ),
                  )
                ],
              ),
            ),

            // Positioned(
            //   left: 233,
            //   top: 200,
            //   child: CircleAvatar(
            //     radius: 16,
            //     backgroundColor: Colors.white.withOpacity(0.9),
            //     child: IconButton(
            //         icon: Icon(
            //           Icons.edit,
            //           color: AppColor.kPrimaryColor,
            //         ),
            //         onPressed: () {
            //           // bottomModelSheetForEditImage() ;
            //         }),
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}

//   void bottomModelSheetForEditImage(){
//      showModalBottomSheet(
//          context: context ,
//          shape: const RoundedRectangleBorder(
//            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
//          ),
//          backgroundColor: Colors.white,
//          builder: (_) => ListView(
//            shrinkWrap: true,
//            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//            children: [
//              const Text("Pick you Image" , style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.bold
//              ),),
//              const SizedBox(height: 20,),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: [
//                  ElevatedButton(onPressed: () async {
//                    final ImagePicker picker = ImagePicker();
// // Pick an image.
//                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//                    if(image != null){
//                      setState(() {
//                        _image = image.path ;
//                      });
//                      await Api.updateProfilePicture(File(_image!)) ;
//                      // Navigator.pop(context) ;
//                    }
//                  },
//                      child: const Text("Pick Image From Gallary")),
//                  ElevatedButton(onPressed: ()async{
//                    final ImagePicker picker = ImagePicker();
// // Pick an image.
//                    final XFile? image = await picker.pickImage(source: ImageSource.camera);
//                    if(image != null){
//                      setState(() {
//                        _image = image.path ;
//                      });
//                      await  Api.updateProfilePicture(File(_image!)) ;
//                      setState(() {
//                       // widget.user.image = _image! ;
//                      });
//                      await Api.updateUserInfo();
//                          Navigator.pop(context) ;
//                    }
//                  },
//                      child: const Text("Pick Image From Camera")),
//                ],
//              )
//            ],
//          )
//      );
//    }
