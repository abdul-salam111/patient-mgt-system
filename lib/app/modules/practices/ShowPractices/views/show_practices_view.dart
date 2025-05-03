import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/routes/app_pages.dart';

import '../controllers/show_practices_controller.dart';

class ShowPracticesView extends GetView<ShowPracticesController> {
  const ShowPracticesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Practices'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.CREATE_PRACTICE);
              },
              icon: Text(
                "Add new",
                style: TextStyle(fontSize: 12.sp, color: primarycolor),
              ),
            )
          ],
        ),
        body: Obx(
          () => controller.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.getAllPractices.value.payload!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          isThreeLine: true,
                          title: Text(controller
                              .getAllPractices.value.payload![index].name!),
                          subtitle: Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              Text(controller.getAllPractices.value
                                  .payload![index].address!),
                              Text(controller.getAllPractices.value
                                  .payload![index].zipcode!),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                // controller.deletePractice(controller
                                // .getAllPractices.value.payload![index].id)
                              },
                              icon: const Icon(Icons.delete))),
                    );

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: mainbetween,
                    //     children: [
                    //       Column(
                    //         crossAxisAlignment: crosstart,
                    //         children: [
                    //           CustomText(
                    //               text: controller.getAllPractices.value
                    //                   .payload![index].name!,
                    //               fontSize: 14.sp,
                    //               color: blackcolor,
                    //               fontWeight: FontWeight.bold),
                    //           5.heightBox,
                    //           CustomText(
                    //               text: ,
                    //               fontSize: 12.sp,
                    //               color: textfieldgrey,
                    //               fontWeight: FontWeight.normal),
                    //           5.heightBox,
                    //           CustomText(
                    //               text: controller.getAllPractices.value
                    //                   .payload![index].zipcode!,
                    //               fontSize: 12.sp,
                    //               color: textfieldgrey,
                    //               fontWeight: FontWeight.normal),
                    //           5.heightBox,
                    //         ],
                    //       )
                    //           .box
                    //           .white
                    //           .outerShadow
                    //           .padding(defaultpad)
                    //           .roundedSM
                    //           .make(),
                    //       IconButton(
                    //           onPressed: () {
                    //             // controller.deletePractice(controller
                    //             //     .getAllPractices.value.payload![index].id);
                    //           },
                    //           icon: const Icon(
                    //             Icons.delete,
                    //             color: textfieldgrey,
                    //           ))
                    //     ],
                    //   ),
                    // );
                  }),
        ));
  }
}
