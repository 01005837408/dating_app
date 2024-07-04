import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

authStateChanges(){
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

pickImage(ImageSource source)async{
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: source);
  if(image != null){
    return image.path ;
  }else{
    print("No image selected") ;
  }

}

class Methods {
  

}