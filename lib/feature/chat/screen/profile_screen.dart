// // ignore_for_file: prefer_const_constructors

// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dating_app/core/api/api.dart';
// import 'package:dating_app/core/helper/helper.dart';

// import 'package:dating_app/core/modal/user_modal.dart';
// import 'package:dating_app/feature/chat/screen/auth/chat_register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileScreen extends StatefulWidget {
//    ProfileScreen({super.key , required this.user});
//   ChatUser user ;
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {

//   final formKey = GlobalKey<FormState>() ;
//   String? _image ;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus() ,
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton.extended(
//             onPressed: ()async{
//               Dialogs.showProgressBar(context) ;
//               await FirebaseAuth.instance.signOut().then((value)async =>
//               await GoogleSignIn().signOut(),);
//               Navigator.of(context).pop() ;
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context)=>const ChatRegister())
//               );
//             },
//             icon:const Icon(Icons.exit_to_app_sharp , color: Colors.green,),
//             label:const Text("Log out" , style: TextStyle(
//           color: Colors.black,
//         ),)),
//         appBar: AppBar(
//           centerTitle: true,
//           automaticallyImplyLeading: true,
//           title:const Text("Profile Screen"),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 40),
//                   Stack(
//                     children: [
//                       _image != null ?
//                       ClipRRect(

//                         borderRadius:BorderRadius.circular(100),
//                         child: Image.file(
//                           File(_image!) ,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.fill,

//                         ),
//                       ):ClipRRect(

//                         borderRadius:BorderRadius.circular(100),
//                         child: CachedNetworkImage(
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.fill,
//                           imageUrl:widget.user.image,
//                           placeholder: (context, url) => CircularProgressIndicator(),
//                           errorWidget: (context, url, error) => Icon(Icons.person),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: MaterialButton(
//                           onPressed: (){
//                             bottomModelShett() ;
//                           },
//                           color: Colors.blue,
//                           shape:const CircleBorder(),
//                           child:const Icon(Icons.edit),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Text(widget.user.email),
//                   SizedBox(height: 20),
//                   TextFormField(
//                    initialValue: widget.user.name,
//                     onSaved: (val) => Api.me!.name = val ??"" ,
//                     validator: (val) => val != null && val.isNotEmpty ? null : "Required Field" ,
//                     decoration: InputDecoration(
//                     labelText:"name",
//                     prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       )

//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     initialValue: widget.user.about,
//                     onSaved: (val) => Api.me!.about = val ??"" ,
//                     validator: (val) => val != null && val.isNotEmpty ? null : "Required Field" ,
//                     decoration: InputDecoration(
//                        labelText: "about",
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         )

//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                       onPressed: (){
//                         if(formKey.currentState!.validate()){
//                           formKey.currentState!.save();
//                           Api.updateUserInfo().then((value) =>
//                             Dialogs.showSnakBar(context, "Updated Successfully") ,
//                           );
//                         }
//                       },

//                       child:const Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.edit),
//                           SizedBox(width: 20,),
//                           Text("Update"),
//                         ],
//                       )
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void bottomModelShett(){
//     showModalBottomSheet(
//       context: context ,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
//         ),
//         backgroundColor: Colors.white,
//       builder: (_) => ListView(
//         shrinkWrap: true,
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         children: [
//           Text("Pick you Image" , style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold
//           ),),
//           SizedBox(height: 20,),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(onPressed: () async {
//                 final ImagePicker picker = ImagePicker();
//                 final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//                 if(image != null){
//                   setState(() {
//                     _image = image.path ;

//                   });
//                   await Api.updateProfilePicture(File(_image!)) ;
//                   Navigator.pop(context) ;
//                 }
//               },
//                   child: Text("Pick Image From Gallary")),
//               ElevatedButton(onPressed: ()async{
//                 final ImagePicker picker = ImagePicker();
//                 final XFile? image = await picker.pickImage(source: ImageSource.camera);
//                 if(image != null){
//                   setState(() {
//                     _image = image.path ;

//                   });
//                  await  Api.updateProfilePicture(File(_image!)) ;
//                   Navigator.pop(context) ;
//                 }
//               },
//                   child: Text("Pick Image From Camera")),
//             ],
//           )

//         ],
//       )
//       );
//   }

// }
