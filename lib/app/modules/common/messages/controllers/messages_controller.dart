// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:patient_management/app/data/getModels/chats/getAllMessages.dart';
// import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
// import 'package:patient_management/app/modules/common/messages/controllers/pusher.dart';
// import 'package:http/http.dart' as http;
// import 'package:patient_management/app/resources/apiKeys.dart';
// import 'package:patient_management/app/resources/storageServices.dart';

// class MessagesController extends GetxController {
//   var getallMessages = GetAllMessages().obs;
//   var isLoading = true.obs;
//   final messageTextController = TextEditingController();
//   final PusherServicess pusherService = Get.put(PusherServicess());
//   var userId = ''.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     userId.value = Get.arguments[0];
//     fetchMessages();
//     // pusherService
//     //     .initPusher(
//     //   'aa10eb203c8277c6c133', // Your Pusher API key
//     //   'ap2', // Your Pusher cluster
//     //   'my-channel', // Your Pusher channel name
//     // )
//     //     .then((_) {
//     //   setupPusherBindings();
//     // });
//   }

//   Future<void> fetchMessages() async {
//     try {
//       String url = signInResponseModelFromJson(
//                       sharedPrefbox.read(userInformation))
//                   .payload!
//                   .user!
//                   .roles![0]
//                   .name ==
//               "admin"
//           ? '$baseUrl/admin/messages/${userId.value}'
//           : signInResponseModelFromJson(sharedPrefbox.read(userInformation))
//                       .payload!
//                       .user!
//                       .roles![0]
//                       .name ==
//                   "staff"
//               ? "$baseUrl/staff/messsages/${userId.value}"
//               : signInResponseModelFromJson(sharedPrefbox.read(userInformation))
//                           .payload!
//                           .user!
//                           .roles![0]
//                           .name ==
//                       "doctor"
//                   ? "$baseUrl/doctor/messages/${userId.value}"
//                   : '$baseUrl/technician/messages/${userId.value}';
//       var response = await http.get(
//         Uri.parse(url),
//         headers: {
//           'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
//           "Content-Type": "application/json"
//         },
//       );

//       if (response.statusCode == 200) {
//         var data = GetAllMessages.fromJson(jsonDecode(response.body));

//         getallMessages.value = data;
//       } else {
//         throw Exception('Failed to load messages');
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void setupPusherBindings() {
//     // pusherService.bindEvent('my-event', (data) {
//     //   getallMessages.value = GetAllMessages.fromJson(jsonDecode(data));
//     // });
//   }

//   void sendMessage() async {
//     String receiverId = userId.value;
//     String message = messageTextController.text.trim();

//     if (message.isEmpty) return;

//     String url = signInResponseModelFromJson(
//                     sharedPrefbox.read(userInformation))
//                 .payload!
//                 .user!
//                 .roles![0]
//                 .name ==
//             "admin"
//         ? '$baseUrl/admin/send/messages'
//         : signInResponseModelFromJson(sharedPrefbox.read(userInformation))
//                     .payload!
//                     .user!
//                     .roles![0]
//                     .name ==
//                 "staff"
//             ? '$baseUrl/staff/send/messages'
//             : signInResponseModelFromJson(sharedPrefbox.read(userInformation))
//                         .payload!
//                         .user!
//                         .roles![0]
//                         .name ==
//                     "doctor"
//                 ? '$baseUrl/doctor/send/messages'
//                 : '$baseUrl/technician/send/messages';

//     var response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "receiver_id": receiverId,
//         "message": message,
//       }),
//     );

//     if (response.statusCode == 200) {
//       messageTextController.clear();

//       fetchMessages(); // Refresh messages
//     } else {
//       print('Failed to send message. Status code: ${response.statusCode}');
//     }
//   }
// }
