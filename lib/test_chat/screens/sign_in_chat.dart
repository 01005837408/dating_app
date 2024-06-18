import 'package:dating_app/core/function/show_taost.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/test_chat/consttent.dart';
import 'package:dating_app/test_chat/screens/home_chat.dart';
import 'package:dating_app/test_chat/screens/sign_up_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatLogin extends StatefulWidget {
  const ChatLogin({super.key});

  @override
  State<ChatLogin> createState() => _ChatKoginState();
}

class _ChatKoginState extends State<ChatLogin> {
  TextEditingController numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the number";
                }
              },
              controller: numController,
            ),
            verticalSpacing(30),
            CustomMaterialBottons(
              onPressed: () {
                if (users
                    .map((e) => e.number)
                    .toList()
                    .contains(numController.text)) {
                  setState(() {
                    currentUser = users[users.indexWhere(
                        (element) => element.number == numController.text)];
                    numController.text = "";
                  });
                  print(numController);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HomeChat()),
                  );
                } else {
                  showToast(message: "message");
                }
              },
              text: "Login",
            ),
            verticalSpacing(20),
            CustomMaterialBottons(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ChatRegister()),
                );
              },
              text: "register",
            ),
          ],
        ),
      ),
    );
  }
}
