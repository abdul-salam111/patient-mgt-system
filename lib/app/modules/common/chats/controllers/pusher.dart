// import 'package:get/get.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class PusherService extends GetxService {
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





