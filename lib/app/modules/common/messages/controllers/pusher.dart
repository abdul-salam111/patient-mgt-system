// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// import 'package:http/http.dart' as http;
// class PusherServicess extends GetxService {
//   late PusherChannelsFlutter pusher;
//   late PusherChannel channel;

//   Future<void> initPusher(String apiKey, String cluster, String channelName) async {
//     pusher = PusherChannelsFlutter.getInstance();
//     await pusher.init(
//       apiKey: apiKey,
//       cluster: cluster,
//       onConnectionStateChange: (currentState, previousState) {
//         print("Pusher connection state: $currentState");
//       },
//       onError: (message, code, exception) {
//         print("Pusher error: $message code: $code exception: $exception");
//       },
//       onSubscriptionSucceeded: (channelName, data) {
//         print("Subscription succeeded for channel: $channelName");
//       },
//       onEvent: (event) {
//         print("Received event: ${event.eventName}");
//       },
//       authEndpoint: "https://your-server.com/pusher/auth", // Replace with your auth endpoint
//       onAuthorizer: (channelName, socketId, options) async {
//         // Implement your authorizer logic here
//         var authResponse = await http.post(
//           Uri.parse("https://your-server.com/pusher/auth"),
//           body: {
//             'channel_name': channelName,
//             'socket_id': socketId,
//           },
//         );

//         if (authResponse.statusCode == 200) {
//           return jsonDecode(authResponse.body);
//         } else {
//           throw Exception("Failed to authenticate channel");
//         }
//       },
//     );

//     channel = await pusher.subscribe(channelName: channelName);
//     await pusher.connect();
//   }

//   void bindEvent(String eventName, Function(String) callback) {
//     (eventName, (PusherEvent event) {
//       callback(event.data);
//     });
//   }
// }
