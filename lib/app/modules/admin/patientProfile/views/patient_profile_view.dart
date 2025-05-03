import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart';
import '../controllers/patient_profile_controller.dart';

class PatientProfileView extends GetView<PatientProfileController> {
  const PatientProfileView({super.key});

  Widget buildProfileRow(String label, String value) {
    return Row(
      mainAxisAlignment: mainbetween,
      children: [
        SizedBox(
          width: 150.w,
          child: CustomText(
            text: "$label:",
            fontSize: 12.sp,
            color: whitecolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 150,
          child: CustomText(
            text: value,
            fontSize: 11.sp,
            color: whitecolor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Payload payload = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${payload.firstName} ${payload.lastName}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          10.heightBox,
          Center(
            child: Image.network(
              "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
              isAntiAlias: true,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            )
                .box
                .clip(Clip.antiAlias)
                .width(150)
                .height(150)
                .border(color: primarycolor, width: 5)
                .rounded
                .make(),
          ),
          5.heightBox,
          CustomText(
            text: "Id: ${payload.patientId}",
            fontSize: 16.sp,
            color: primarycolor,
            fontWeight: FontWeight.bold,
          ),
          30.heightBox,
          Expanded(
            child: ListView(
              padding: pad20,
              children: [
                buildProfileRow("Complete Name",
                    "${payload.firstName} ${payload.lastName}"),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Gender", payload.sex.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Date Of Birth", payload.dob.toString().split(' ')[0]),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Status", payload.status.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Phone", payload.contactNumber.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("City", payload.city.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("State", payload.state.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Zipcode", payload.zip.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Location", payload.location.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("MI", payload.mi.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Requesting Physician",
                    payload.requestingPhysician.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Primary Insurance", payload.primaryInsurance.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Secondary Insurance",
                    payload.secondaryInsurance.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("MedicaId", payload.medicaid.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Hrs", payload.hrs.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Continuous Intermittent",
                    payload.continuousIntermittent.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Rescheduled Reason", payload.rescheduledReason.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Read Packets To Dr", payload.readPacketToDr.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Medications", payload.medications.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Setup Technician", payload.setupTechnician.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Disconnect Technician",
                    payload.disconnectTechnician.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Pre Auth Ref Number", payload.preAuthRefNbr.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Sbill Submitted", payload.sbillSubmitted.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Professional Component",
                    payload.professionalComponent.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Professional Component Practice",
                    payload.professionalComponentPractice.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Purning Technician", payload.pruningTechnician.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Purning Journal", payload.patientJournal.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Carrier", payload.carrier.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Monitoring Shift", payload.monitoringShift.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Monitoring Shift", payload.monitoringShift.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("ICD codes", payload.id.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow("Invoice", payload.invoice.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
                buildProfileRow(
                    "Amount Recieved", payload.amountReceived.toString()),
                const Divider(
                  color: whitecolor,
                  height: 30,
                ),
              ],
            )
                .box
                .color(primarycolor)
                .topRounded(value: 30)
                .width(double.infinity)
                .make(),
          ),
        ],
      ),
    );
  }
}
