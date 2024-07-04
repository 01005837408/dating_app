// // ignore_for_file: prefer_const_constructors

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dating_app/core/spacing/spacing.dart';
// import 'package:dating_app/core/utils/colors.dart';
// import 'package:dating_app/core/widget/custom_appbar.dart';
// import 'package:shimmer/shimmer.dart';

// class ProfilePhotosScreen extends StatefulWidget {
//   const ProfilePhotosScreen({super.key});

//   @override
//   _ProfilePhotosScreenState createState() => _ProfilePhotosScreenState();
// }

// class _ProfilePhotosScreenState extends State<ProfilePhotosScreen> {
//   List<String> _imageUrls = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchImages();
//   }

//   Future<void> _fetchImages() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('images').orderBy('timestamp', descending: true).get();
//     setState(() {
//       _imageUrls = querySnapshot.docs.map((doc) => doc['url'] as String).toList();
//       _isLoading = false;
//     });
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null) {
//       File image = File(pickedFile.path);
//       await _uploadImage(image);
//     }
//   }

//   Future<void> _uploadImage(File image) async {
//     try {
//       String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
//       UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(image);

//       TaskSnapshot snapshot = await uploadTask;
//       String downloadURL = await snapshot.ref.getDownloadURL();

//       await FirebaseFirestore.instance.collection('images').add({
//         'url': downloadURL,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       setState(() {
//         _imageUrls.add(downloadURL);
//       });

//       print('Image uploaded successfully: $downloadURL');
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   Future<void> _deleteImage(String imageUrl) async {
//     try {
//       await FirebaseStorage.instance.refFromURL(imageUrl).delete();
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('images')
//           .where('url', isEqualTo: imageUrl)
//           .get();
//       for (var doc in querySnapshot.docs) {
//         await FirebaseFirestore.instance.collection('images').doc(doc.id).delete();
//       }
//       setState(() {
//         _imageUrls.remove(imageUrl);
//       });
//       print('Image deleted successfully: $imageUrl');
//     } catch (e) {
//       print('Error deleting image: $e');
//     }
//   }

//   void _showDeleteDialog(String imageUrl) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Delete Image'),
//         content: Text('Are you sure you want to delete this image?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               _deleteImage(imageUrl);
//             },
//             child: Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => Container(
//         color: AppColor.kPrimaryColor,
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text("Pick Image From Gallery or Camera", style: TextStyle(fontSize: 20, color: Colors.white)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _pickImage(ImageSource.gallery);
//               },
//               child: Text("Pick Image From Gallery"),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _pickImage(ImageSource.camera);
//               },
//               child: Text("Pick Image From Camera"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomAppBar(
//                 widget: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios_new,
//                     color: Colors.white,
//                   ),
//                 ),
//                 backgroundColor: AppColor.kPrimaryColor,
//                 text: 'الصور',
//               ),
//               verticalSpacing(15),
//               ProfilePhotosHeaderContainer(onCameraTap: _showBottomSheet),
//               verticalSpacing(20),
//               const Divider(
//                 indent: 50,
//                 endIndent: 50,
//                 color: AppColor.kPrimaryColor,
//                 thickness: 4,
//               ),
//               _isLoading
//                   ? ShimmerLoadingGrid()
//                   : GridViewPhotos(imageUrls: _imageUrls, onLongPress: _showDeleteDialog),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfilePhotosHeaderContainer extends StatelessWidget {
//   final VoidCallback onCameraTap;

//   const ProfilePhotosHeaderContainer({super.key, required this.onCameraTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 1.2,
//       height: MediaQuery.of(context).size.height / 2.2,
//       decoration: BoxDecoration(
//         color: AppColor.kPrimaryColor,
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 60),
//             child: IconButton(
//               onPressed: onCameraTap,
//               icon: Icon(
//                 Icons.camera_alt,
//                 color: Colors.white,
//               ),
//               iconSize: 180,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 30, bottom: 20),
//               child: Container(
//                 decoration: const BoxDecoration(
//                     shape: BoxShape.circle, color: Colors.white),
//                 child: IconButton(
//                   onPressed: onCameraTap,
//                   icon: const Icon(
//                     Icons.add,
//                     color: AppColor.kPrimaryColor,
//                     size: 60,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GridViewPhotos extends StatelessWidget {
//   final List<String> imageUrls;
//   final Function(String) onLongPress;

//   const GridViewPhotos({
//     super.key,
//     required this.imageUrls,
//     required this.onLongPress,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: imageUrls.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           childAspectRatio: 2 / 2,
//         ),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onLongPress: () => onLongPress(imageUrls[index]),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(27),
//                 border: Border.all(
//                   color: AppColor.kPrimaryColor,
//                   width: 2,
//                 ),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: Image.network(imageUrls[index], fit: BoxFit.cover),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ShimmerLoadingGrid extends StatelessWidget {
//   const ShimmerLoadingGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: 4, // The number of shimmer boxes you want to show
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           childAspectRatio: 2 / 2,
//         ),
//         itemBuilder: (context, index) {
//           return Shimmer.fromColors(
//             baseColor: const Color.fromARGB(255, 236, 69, 69)!,
//             highlightColor: Color.fromARGB(255, 105, 23, 160)!,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(27),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
