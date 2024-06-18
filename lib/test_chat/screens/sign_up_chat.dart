import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/test_chat/consttent.dart';
import 'package:dating_app/test_chat/models/user_modal.dart';
import 'package:dating_app/test_chat/screens/home_chat.dart';
import 'package:dating_app/test_chat/screens/sign_in_chat.dart';
import 'package:flutter/material.dart';

class ChatRegister extends StatefulWidget {
  const ChatRegister({super.key});

  @override
  State<ChatRegister> createState() => _ChatRegisterState();
}

class _ChatRegisterState extends State<ChatRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CustomTextFormField(
                hintText: "name",
                lableText: "name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter the name";
                  }
                },
                controller: nameController,
              ),
              verticalSpacing(20),
              CustomTextFormField(
                hintText: "number",
                lableText: "number",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter the number";
                  }
                },
                controller: numController,
              ),
              verticalSpacing(20),
              CustomTextFormField(
                hintText: "image",
                lableText: "image",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter the number";
                  }
                },
                controller: imageController,
              ),
              verticalSpacing(20),
              CustomMaterialBottons(
                onPressed: () {
                  users.add(UserModal(
                      image: imageController.text,
                      name: nameController.text,
                      number: numController.text));
                      setState(() {
                        currentUser = users[users.indexWhere(
                        (element) => element.number == numController.text)];
                      });
                       Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HomeChat()),
                  );
                },
                text: "register",
              ),
              verticalSpacing(20),
              CustomMaterialBottons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ChatLogin()),
                  );
                },
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
