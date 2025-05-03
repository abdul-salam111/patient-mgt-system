// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:patient_management/app/data/getModels/chats/getchatmodel.dart';
// import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
// import 'package:patient_management/app/modules/common/chats/controllers/pusher.dart';
// import 'package:patient_management/app/resources/apiKeys.dart';
// import 'package:patient_management/app/resources/storageServices.dart';

// class ChatsController extends GetxController {
//   var getAllChats = GetAllChats().obs;
//   var isLoading = true.obs;
//   final PusherService pusherService = Get.put(PusherService());

//   @override
//   void onInit() {
//     super.onInit();
//     fetchChatUsers();
//     pusherService
//         .initPusher(
//       'aa10eb203c8277c6c133', // Your Pusher API key
//       'ap2', // Your Pusher cluster
//       'my-channel', // Your Pusher channel name
//     )
//         .then((_) {
//       setupPusherBindings();
//     });
//   }

//   Future<void> fetchChatUsers() async {
//     try {
//       isLoading(true);
//       final response = await http.get(
//         Uri.parse(signInResponseModelFromJson(
//                         sharedPrefbox.read(userInformation))
//                     .payload!
//                     .user!
//                     .roles![0]
//                     .name ==
//                 "admin"
//             ? fetchadminchats
//             : signInResponseModelFromJson(sharedPrefbox.read(userInformation))
//                         .payload!
//                         .user!
//                         .roles![0]
//                         .name ==
//                     "staff"
//                 ? "$baseUrl/staff/chat/users"
//                 : signInResponseModelFromJson(
//                                 sharedPrefbox.read(userInformation))
//                             .payload!
//                             .user!
//                             .roles![0]
//                             .name ==
//                         "doctor"
//                     ? "$baseUrl/doctor/chat/users"
//                     : fetchchatsfortechnicianUrl),
//         headers: {
//           'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
//         },
//       );

//       if (response.statusCode == 200) {
//         getAllChats.value = GetAllChats.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to load chat users');
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void setupPusherBindings() {
//     pusherService.bindEvent('my-event', (data) {
//       getAllChats.value = GetAllChats.fromJson(jsonDecode(data));
//     });
//   }
// }
