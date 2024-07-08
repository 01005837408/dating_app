// import 'package:dating_app/test/cubit_signUp.dart';
// import 'package:dating_app/test/home2.dart';
// import 'package:dating_app/test/signUp_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class SignUpPage extends StatelessWidget {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   DateTime? _selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: BlocProvider(
//         create: (context) => UserCubit(),
//         child: BlocConsumer<UserCubit, UserState>(
//           listener: (context, state) {
//             if (state is UserLoaded) {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (context) => HomePage(user: state.user),
//               ));
//             } else if (state is UserError) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.message)),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is UserLoading) {
//               return Center(child: CircularProgressIndicator());
//             }
        
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _nameController,
//                     decoration: InputDecoration(labelText: 'Name'),
//                   ),
//                   TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(labelText: 'Email'),
//                   ),
//                   TextField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2101),
//                       );
//                       if (pickedDate != null) {
//                         _selectedDate = pickedDate;
//                       }
//                     },
//                     child: Text(_selectedDate == null ? 'Select Date' : _selectedDate.toString()),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_nameController.text.isNotEmpty &&
//                           _emailController.text.isNotEmpty &&
//                           _passwordController.text.isNotEmpty &&
//                           _selectedDate != null) {
//                         context.read<UserCubit>().signUp(
//                               _nameController.text,
//                               _emailController.text,
//                               _passwordController.text,
//                               _selectedDate!,
//                             );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Please fill all fields')),
//                         );
//                       }
//                     },
//                     child: Text('Sign Up'),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
