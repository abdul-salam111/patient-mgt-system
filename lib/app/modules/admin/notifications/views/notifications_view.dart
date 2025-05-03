import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/notifications/getNotifications.dart';
import 'package:patient_management/app/resources/colors.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.getAllNotifications(),
            builder: (context, AsyncSnapshot<GetNotificationsModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.payload!.isEmpty) {
                return const Center(
                  child: Text("No Notifications exist"),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: greyColor.withOpacity(0.3),
                        leading: CircleAvatar(
                          child: Text(
                            snapshot.data!.payload![index].notification!
                                .toString()[0],
                          ),
                        ),
                        title: Text(
                          snapshot.data!.payload![index].notification!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.payload!.length,
                );
              }
            }));
  }
}
