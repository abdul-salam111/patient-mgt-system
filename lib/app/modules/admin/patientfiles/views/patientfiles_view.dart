import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart'
    as pat;
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/patientfiles_controller.dart';

class PatientfilesView extends GetView<PatientfilesController> {
  const PatientfilesView({super.key});
  @override
  Widget build(BuildContext context) {
    pat.Payload data = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("${data.firstName}${data.lastName} Files"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
              itemCount: data.files!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Image.asset(
                      "assets/images/xlsx.png",
                    ),
                    Text(
                      data.files![index].fileName!,
                      style: const TextStyle(color: blackcolor),
                    )
                  ],
                ).box.white.outerShadow.padding(defaultpad).make().onTap(() {
                  controller.downloadAndOpenExcelFile(
                      data.files![index].fileAddress!);
                });
              }),
        ));
  }
}
