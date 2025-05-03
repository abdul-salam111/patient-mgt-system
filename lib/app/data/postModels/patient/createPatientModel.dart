// To parse this JSON data, do
//
//     final createPatientModel = createPatientModelFromJson(jsonString);

import 'dart:convert';

CreatePatientModel createPatientModelFromJson(String str) =>
    CreatePatientModel.fromJson(json.decode(str));

String createPatientModelToJson(CreatePatientModel data) =>
    json.encode(data.toJson());

class CreatePatientModel {
  final String? firstName;
  final String? lastName;
  final String? mi;
  final String? dob;
  final String? requestingPhysician;
  final String? practiceId;
  final String? primaryInsurance;
  final String? secondaryInsurance;
  final String? medicaid;
  final String? hrs;
  final String? continuousIntermittent;
  final String? sex;
  final String? rescheduledReason;
  final String? readPacketToDr;
  final String? medications;
  final String? location;
  final String? contactNumber;
  final String? setupTechnician;
  final String? disconnectTechnician;
  final String? preAuthRefNbr;
  final String? sbillSubmitted;
  final String? professionalComponent;
  final String? professionalComponentPractice;
  final String? pruningTechnician;
  final String? patientJournal;
  final String? carrier;
  final String? streetAddress;
  final String? city;
  final String? state;
  final String? zip;
  final String? monitoringShift;
  final String? invoice;
  final String? amountReceived;
  final List<String>? icdCodeId;
  final String? faxed;
  final String? datePruningCompleted;
  final String? rescheduledDateSetup;
  final String? rescheduledDateDisconnect;
  final String? datePaymentReceived;
  final String? dateHookup;
  final String? datedisconnect;
  final String? folderscreated;
  final String? prunerNotificationSent;
  final String? datePrunerPaid;
  final String? status;
  final String? dateRecieved;

  CreatePatientModel({
    this.firstName,
    this.datePrunerPaid,
    this.dateRecieved,
    this.folderscreated,
    this.datedisconnect,
    this.dateHookup,
    this.status,
    this.datePruningCompleted,
    this.prunerNotificationSent,
    this.lastName,
    this.datePaymentReceived,
    this.mi,
    this.rescheduledDateDisconnect,
    this.dob,
    this.icdCodeId,
    this.requestingPhysician,
    this.practiceId,
    this.primaryInsurance,
    this.secondaryInsurance,
    this.medicaid,
    this.rescheduledDateSetup,
    this.faxed,
    this.hrs,
    this.continuousIntermittent,
    this.sex,
    this.rescheduledReason,
    this.readPacketToDr,
    this.medications,
    this.location,
    this.contactNumber,
    this.setupTechnician,
    this.disconnectTechnician,
    this.preAuthRefNbr,
    this.sbillSubmitted,
    this.professionalComponent,
    this.professionalComponentPractice,
    this.pruningTechnician,
    this.patientJournal,
    this.carrier,
    this.streetAddress,
    this.city,
    this.state,
    this.zip,
    this.monitoringShift,
    this.invoice,
    this.amountReceived,
  });

  factory CreatePatientModel.fromJson(Map<String, dynamic> json) =>
      CreatePatientModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        mi: json["mi"],
        datePrunerPaid: json['date_pruner_paid'],
        prunerNotificationSent: json['pruner_notification_sent'],
        folderscreated: json['folders_created'],
        dateHookup: json['date_hookup'],
        rescheduledDateSetup: json['rescheduled_date_setup'],
        rescheduledDateDisconnect: json['rescheduled_date_disconnect'],
        datePruningCompleted: json["date_pruning_completed"],
        dob: json["dob"],
        dateRecieved: json['date_received'],
        faxed: json['report_faxed'],
        requestingPhysician: json["requesting_physician"],
        practiceId: json["practice_id"],
        datePaymentReceived: json['date_payment_received'],
        primaryInsurance: json["primary_insurance"],
        secondaryInsurance: json["secondary_insurance"],
        medicaid: json["medicaid"],
        hrs: json["hrs"],
        status: json['status'],
        datedisconnect: json['date_disconnect'],
        continuousIntermittent: json["continuous_intermittent"],
        sex: json["sex"],
        rescheduledReason: json["rescheduled_reason"],
        readPacketToDr: json["read_packet_to_dr"],
        medications: json["medications"],
        location: json["location"],
        contactNumber: json["contact_number"],
        setupTechnician: json["setup_technician"],
        disconnectTechnician: json["disconnect_technician"],
        preAuthRefNbr: json["pre_auth_ref_nbr"],
        sbillSubmitted: json["sbill_submitted"],
        professionalComponent: json["professional_component"],
        professionalComponentPractice: json["professional_component_practice"],
        pruningTechnician: json["pruning_technician"],
        patientJournal: json["patient_journal"],
        carrier: json["carrier"],
        streetAddress: json["street_address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        monitoringShift: json["monitoring_shift"],
        invoice: json["invoice"],
        amountReceived: json["amount_received"],
        icdCodeId: json["icd_code_id"] == null
            ? []
            : List<String>.from(json["icd_code_id"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "mi": mi,
        "pruner_notification_sent": prunerNotificationSent,
        "date_disconnect": datedisconnect,
        "date_pruning_completed": datePruningCompleted,
        "dob": dob,
        "date_payment_received": datePaymentReceived,
        "folders_created": folderscreated,
        "report_faxed": faxed,
        "date_pruner_paid": datePrunerPaid,
        "date_hookup": dateHookup,
        "rescheduled_date_setup": rescheduledDateSetup,
        "rescheduled_date_disconnect": rescheduledDateDisconnect,
        "requesting_physician": requestingPhysician,
        "practice_id": practiceId,
        "primary_insurance": primaryInsurance,
        "secondary_insurance": secondaryInsurance,
        "medicaid": medicaid,
        "hrs": hrs,
        "date_received": dateRecieved,
        "continuous_intermittent": continuousIntermittent,
        "sex": sex,
        "status": status,
        "rescheduled_reason": rescheduledReason,
        "read_packet_to_dr": readPacketToDr,
        "medications": medications,
        "location": location,
        "contact_number": contactNumber,
        "setup_technician": setupTechnician,
        "disconnect_technician": disconnectTechnician,
        "pre_auth_ref_nbr": preAuthRefNbr,
        "sbill_submitted": sbillSubmitted,
        "professional_component": professionalComponent,
        "professional_component_practice": professionalComponentPractice,
        "pruning_technician": pruningTechnician,
        "patient_journal": patientJournal,
        "carrier": carrier,
        "street_address": streetAddress,
        "city": city,
        "state": state,
        "zip": zip,
        "monitoring_shift": monitoringShift,
        "invoice": invoice,
        "amount_received": amountReceived,
        "icd_code_id": icdCodeId,
      };
}
