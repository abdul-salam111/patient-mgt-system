import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart'
    as login;
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});
  @override
  Widget build(BuildContext context) {
    var name = Get.arguments[1];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF6F6F6),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: primarycolor,
                ),
              ),
              20.widthBox,
              Row(
                mainAxisAlignment: maincenter,
                children: [
                  CircleAvatar(
                    child: Text(name.toString()[0]),
                  ),
                  5.widthBox,
                  CustomText(
                      text: name,
                      fontSize: 14.sp,
                      color: blackcolor,
                      fontWeight: FontWeight.w500),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        body: Center()
        // Column(
        //   children: [
        //     Expanded(
        //       child: Obx(
        //         () => controller.isLoading.value == true
        //             ? const Center()
        //             : ListView.builder(
        //                 itemCount:
        //                     controller.getallMessages.value.payload!.length,
        //                 itemBuilder: (context, index) {
        //                   final message =
        //                       controller.getallMessages.value.payload![index];

        //                   return Align(
        //                     alignment: message.receiverId ==
        //                             login
        //                                 .signInResponseModelFromJson(
        //                                     sharedPrefbox.read(userInformation))
        //                                 .payload!
        //                                 .user!
        //                                 .id
        //                         ? Alignment.centerLeft
        //                         : Alignment.centerRight,
        //                     child: Container(
        //                       padding: const EdgeInsets.all(10),
        //                       margin: const EdgeInsets.symmetric(
        //                           vertical: 5, horizontal: 10),
        //                       decoration: BoxDecoration(
        //                         color: message.receiverId ==
        //                                 login
        //                                     .signInResponseModelFromJson(
        //                                         sharedPrefbox
        //                                             .read(userInformation))
        //                                     .payload!
        //                                     .user!
        //                                     .id
        //                             ? Colors.grey[300]
        //                             : primarycolor,
        //                         borderRadius: BorderRadius.circular(10),
        //                       ),
        //                       child: Text(
        //                         message.message!,
        //                         style: TextStyle(
        //                             color: message.receiverId ==
        //                                     login
        //                                         .signInResponseModelFromJson(
        //                                             sharedPrefbox
        //                                                 .read(userInformation))
        //                                         .payload!
        //                                         .user!
        //                                         .id
        //                                 ? Colors.black
        //                                 : Colors.white),
        //                       ),
        //                     ),
        //                   );
        //                 },
        //               ),
        //       ),
        //     ),
        //     Container(
        //       color: const Color(0xffF6F6F6),
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: TextField(
        //                 style: const TextStyle(color: blackcolor),
        //                 controller: controller.messageTextController,
        //                 decoration: InputDecoration(
        //                   fillColor: whitecolor,
        //                   filled: true,
        //                   contentPadding:
        //                       const EdgeInsets.only(top: 0, bottom: 0, left: 10),
        //                   hintText: 'Enter message...',
        //                   border: OutlineInputBorder(
        //                     borderSide: const BorderSide(color: greyColor),
        //                     borderRadius: BorderRadius.circular(50),
        //                   ),
        //                   enabledBorder: OutlineInputBorder(
        //                     borderSide: const BorderSide(color: greyColor),
        //                     borderRadius: BorderRadius.circular(50),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderSide: const BorderSide(color: textfieldgrey),
        //                     borderRadius: BorderRadius.circular(50),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             10.widthBox,
        //             GestureDetector(
        //               onTap: controller.sendMessage,
        //               child: const Icon(
        //                 Icons.send,
        //                 color: primarycolor,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
