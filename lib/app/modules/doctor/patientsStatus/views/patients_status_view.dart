import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customShimmer.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../resources/colors.dart';
import '../controllers/patients_status_controller.dart';

class PatientsStatusView extends GetView<PatientsStatusController> {
  const PatientsStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientsStatusController controller =
        Get.put(PatientsStatusController());
    controller.fetchAllStatus();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PatientsStatusView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const ShimmerListView()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    controller.statusesList.length,
                    (index) {
                      var statusid = controller
                          .statusesList[index].notificationPreference.statusId;
                      var status = controller.statusesList[index];
                      var notificationPreference =
                          status.notificationPreference;

                      // Initialize RxBool values
                      var viaEmail = RxBool(notificationPreference.viaEmail);
                      var viaSMS = RxBool(notificationPreference.viaSms);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.widthBox,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: status.name,
                                        fontSize: 12.sp,
                                        color: blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      5.heightBox,
                                      Row(
                                        children: [
                                          Obx(() => Checkbox(
                                                value: viaEmail.value,
                                                onChanged: (bool? value) {
                                                  viaEmail.value = value!;
                                                },
                                              )),
                                          const Text(
                                            'Email',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Obx(() => Checkbox(
                                                value: viaSMS.value,
                                                onChanged: (bool? value) {
                                                  viaSMS.value = value!;
                                                },
                                              )),
                                          const Text(
                                            'SMS',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Call a method to save changes
                                          controller.saveChanges(
                                            statusid,
                                            viaEmail.value,
                                            viaSMS.value,
                                          );
                                        },
                                        child: const Text('Save Changes'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                            .box
                            .white
                            .outerShadow
                            .padding(defaultpad)
                            .rounded
                            .make(),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
