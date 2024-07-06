import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_body.dart';
import 'package:dating_app/feature/settings_profile/settings_Screen_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });
// ChatUser user ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  backgroundColor: Colors.white,
                  iconColor: AppColor.kPrimaryColor,
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreenProfile())),
                  widget: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFFEDB2C2),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColor.kPrimaryColor,
                        size: 30,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                const ProfileBody(),
              ],
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