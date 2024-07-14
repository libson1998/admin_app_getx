// import 'package:adminapp/common_widgets/form_widget.dart';
// import 'package:adminapp/common_widgets/sized_box_heigh_width.dart';
// import 'package:adminapp/theme/theme.dart';
// import 'package:adminapp/utils/constants.dart';
// import 'package:flutter/material.dart';
//
// class LoginWithQrScreen extends StatefulWidget {
//   const LoginWithQrScreen({super.key});
//
//   @override
//   State<LoginWithQrScreen> createState() => _LoginWithQrScreenState();
// }
//
// class _LoginWithQrScreenState extends State<LoginWithQrScreen> {
//   Orientation? orientation;
//   String? _selectedItem;
//
//   @override
//   Widget build(BuildContext context) {
//     orientation = MediaQuery.of(context).orientation;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     double getResponsiveFontSize() {
//       if (screenWidth < 600) {
//         return 20; // Small screens
//       } else if (screenWidth < 1200) {
//         return 24; // Medium screens
//       } else {
//         return 28; // Large screens
//       }
//     }
//
//     return Scaffold(
//       backgroundColor: background,
//       resizeToAvoidBottomInset: orientation == Orientation.portrait?false:true,
//       body: SafeArea(
//         child: orientation == Orientation.portrait
//             ? _buildPortraitLayout(
//                 screenWidth, screenHeight, getResponsiveFontSize)
//             : _buildLandscapeLayout(
//                 screenWidth, screenHeight, getResponsiveFontSize),
//       ),
//     );
//   }
//
//   Widget _buildPortraitLayout(double screenWidth, double screenHeight,
//       double Function() getResponsiveFontSize) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: _buildForm(getResponsiveFontSize),
//           ),
//         ),
//         Expanded(flex: 1, child: _buildImageAndQR(screenWidth, screenHeight)),
//       ],
//     );
//   }
//
//   Widget _buildLandscapeLayout(double screenWidth, double screenHeight,
//       double Function() getResponsiveFontSize) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: _buildForm(getResponsiveFontSize),
//           ),
//         ),
//         Expanded(
//           child: _buildImageAndQR(screenWidth, screenHeight),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildForm(double Function() getResponsiveFontSize) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//              CustomSizedBox(height:orientation == Orientation.portrait? screenWidth*0.1:0),
//           Column(
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "Welcome to Alasmakh eGuest",
//                     style: TextStyle(
//                         fontSize: getResponsiveFontSize(),
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 12),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.asset(
//                       "assets/images/qatar.jpg",
//                       height: screenWidth * 0.1,
//                       width: screenWidth * 0.1,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   const Text(
//                     "Residential: Residential Test",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   const Expanded(
//                     flex: 1,
//                     child: Text(
//                       "Name:",
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: SizedBox(
//                       height: 40,
//                       child: FormFieldWidget(
//                         passwordObscure: false,
//                         isIconVisible: false,
//                         initialValue: "",
//                         onSave: (newValue) {
//                           // authProvider.strMobile = newValue!;
//                         },
//                         onChange: (value) {
//                           // authProvider.strMobile = value;
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "This field cannot be empty";
//                           } else if (value.length > 10) {
//                             return "Please enter valid mobile number";
//                           }
//                           return null;
//                         },
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 1),
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 1),
//                         ),
//                         errorBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.red, width: 1),
//                         ),
//                         labelStyle:
//                             const TextStyle(fontSize: 14, color: textColor),
//                         style: const TextStyle(color: Colors.white),
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 16),
//                         keyboardType: TextInputType.text,
//                         hintText: "",
//                         hintStyle: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500),
//                         child: const SizedBox(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const CustomSizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   const Expanded(
//                     flex: 2,
//                     child: Text(
//                       "Mobile Number:  ",
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ),
//                   CustomSizedBox(
//                     width: 8,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: SizedBox(
//                       height: 40,
//                       child: FormFieldWidget(
//                         passwordObscure: false,
//                         isIconVisible: false,
//                         initialValue: "QATAR",
//                         onSave: (newValue) {
//                           // authProvider.strMobile = newValue!;
//                         },
//                         onChange: (value) {
//                           // authProvider.strMobile = value;
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "This field cannot be empty";
//                           } else if (value.length > 10) {
//                             return "Please enter valid mobile number";
//                           }
//                           return null;
//                         },
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 1),
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 1),
//                         ),
//                         errorBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.red, width: 1),
//                         ),
//                         labelStyle: const TextStyle(
//                             fontSize: 14, color: Colors.white),
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 16),
//                         keyboardType: TextInputType.number,
//                         hintText: "",
//                         style: const TextStyle(color: Colors.white),
//                         hintStyle: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500),
//                         child: const SizedBox(),
//                       ),
//                     ),
//                   ),
//                   const CustomSizedBox(
//                     width: 12,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: SizedBox(
//                       height: 40,
//                       child: FormFieldWidget(
//                         style: const TextStyle(color: Colors.white),
//                         passwordObscure: false,
//                         isIconVisible: false,
//                         initialValue: "",
//                         onSave: (newValue) {
//                           // authProvider.strMobile = newValue!;
//                         },
//                         onChange: (value) {
//                           // authProvider.strMobile = value;
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "This field cannot be empty";
//                           } else if (value.length > 10) {
//                             return "Please enter valid mobile number";
//                           }
//                           return null;
//                         },
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 1),
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 1),
//                         ),
//                         errorBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.red, width: 1),
//                         ),
//                         labelStyle:
//                             const TextStyle(fontSize: 14, color: textColor),
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 16),
//                         keyboardType: TextInputType.text,
//                         hintText: "",
//                         hintStyle: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500),
//                         child: const SizedBox(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const CustomSizedBox(height: 20),
//               Row(
//                 children: [
//                   const Expanded(
//                     flex: 1,
//                     child: Text(
//                       "Apartment:",
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(4.0),
//                           borderSide: const BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(0.0),
//                           borderSide: const BorderSide(color: Colors.white),
//                         ),
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 10),
//                       ),
//                       dropdownColor: background,
//                       // Set the dropdown menu color
//                       value: _selectedItem,
//                       hint: const Text('Select an item',
//                           style: TextStyle(color: Colors.white)),
//                       items: <String>[
//                         'Choose Apartment',
//                         'Apartment 1',
//                         'Apartment 2',
//                         'Apartment 3'
//                       ].map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: const TextStyle(
//                                 color: Colors
//                                     .white), // Set the dropdown item text color
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedItem = newValue;
//                         });
//                       },
//                       style: const TextStyle(
//                           color: Colors
//                               .black), // Set the selected item text color
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImageAndQR(double screenWidth, double screenHeight) {
//     return Container(
//       width: screenWidth,
//       height: screenHeight,
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(
//                 "assets/images/background.jpg",
//               ),
//               fit: BoxFit.cover)),
//       child: Padding(
//         padding:   EdgeInsets.all(orientation == Orientation.portrait?screenHeight*0.1:screenWidth*0.17),
//         child: Image.asset(
//           "assets/images/qr.jpg",
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
