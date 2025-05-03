import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/chats_controller.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});
  @override
  Widget build(BuildContext context) {
    // Get.put(ChatsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          centerTitle: true,
        ),
        body: Center());
    // Obx(() => controller.isLoading.value == true
    //     ? ListView.builder(
    //         itemCount: 10,
    //         itemBuilder: (context, index) {
    //           return Shimmer.fromColors(
    //             baseColor: Colors.grey[300]!,
    //             highlightColor: Colors.grey[100]!,
    //             child: ListTile(
    //               leading: CircleAvatar(
    //                 radius: 30.r,
    //                 backgroundColor: Colors.white,
    //               ),
    //               title: Container(
    //                 width: double.infinity,
    //                 height: 15.0.h,
    //                 color: Colors.white,
    //               ),
    //               subtitle: Container(
    //                 width: double.infinity,
    //                 height: 15.0,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           );
    //         },
    //       )
    //     : controller.getAllChats.value.payload!.isEmpty
    //         ? const Center(
    //             child: Text(
    //               "No chats found",
    //               style: TextStyle(color: blackcolor),
    //             ),
    //           )
    //         : ListView.builder(
    //             itemCount: controller.getAllChats.value.payload!.length,
    //             itemBuilder: (context, index) {
    //               return ListTile(
    //                 tileColor: greyColor,
    //                 onTap: () {
    //                   Get.toNamed(Routes.MESSAGES, arguments: [
    //                     controller.getAllChats.value.payload![index].id
    //                         .toString(),
    //                     controller.getAllChats.value.payload![index].name,
    //                   ]);
    //                 },
    //                 leading: CircleAvatar(
    //                   child: Text(
    //                     controller.getAllChats.value.payload![index].name
    //                         .toString()[0],
    //                     style: const TextStyle(
    //                         fontWeight: FontWeight.bold, fontSize: 17),
    //                   ),
    //                 ),
    //                 subtitle: Text(controller
    //                     .getAllChats.value.payload![index].roles![0].name
    //                     .toString()),
    //                 // subtitle: controller.getAllChats.value.payload![index]
    //                 //             .latestMessage !=
    //                 //         null
    //                 //     ? Text(S
    //                 //         controller.getAllChats.value.payload![index]
    //                 //             .latestMessage!.message!,
    //                 //         style: const TextStyle(color: textfieldgrey),
    //                 //       )
    //                 //     : const SizedBox.shrink(),
    //                 title: Text(
    //                   controller.getAllChats.value.payload![index].name!,
    //                   style: const TextStyle(
    //                       color: blackcolor, fontWeight: FontWeight.bold),
    //                 ),
    //                 trailing: Column(
    //                   crossAxisAlignment: crossend,
    //                   children: [
    //                     10.heightBox,
    //                     Text(
    //                       controller
    //                           .getAllChats.value.payload![index].createdAt
    //                           .toString()
    //                           .split('T')[0],
    //                       style: const TextStyle(
    //                           fontWeight: FontWeight.normal,
    //                           color: textfieldgrey),
    //                     ),
    //                     5.heightBox,
    //                     const Icon(
    //                       Icons.arrow_forward_ios,
    //                       color: textfieldgrey,
    //                       size: 16,
    //                     ),
    //                   ],
    //                 ),
    //               )
    //                   .box
    //                   .white
    //                   .outerShadow
    //                   .padding(pad5)
    //                   .rounded
    //                   .margin(const EdgeInsets.only(
    //                       top: 10, right: 10, left: 10))
    //                   .make();
    //             })));
  }
}
