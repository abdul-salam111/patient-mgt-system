// To parse this JSON data, do
//
//     final getAllPatientsForTechnicians = getAllPatientsForTechniciansFromJson(jsonString);

import 'dart:convert';

GetAllPatientsForTechnicians getAllPatientsForTechniciansFromJson(String str) => GetAllPatientsForTechnicians.fromJson(json.decode(str));

String getAllPatientsForTechniciansToJson(GetAllPatientsForTechnicians data) => json.encode(data.toJson());

class GetAllPatientsForTechnicians {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetAllPatientsForTechnicians({
        this.success,
        this.message,
        this.payload,
    });

    factory GetAllPatientsForTechnicians.fromJson(Map<String, dynamic> json) => GetAllPatientsForTechnicians(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class Payload {
    final int? id;
    final int? userId;
    final String? firstName;
    final String? lastName;
    final String? mi;
    final String? patientId;
    final DateTime? dob;
    final dynamic dateReceived;
    final String? requestingPhysician;
    final dynamic practiceId;
    final String? primaryInsurance;
    final String? secondaryInsurance;
    final dynamic dateHookup;
    final dynamic dateDisconnect;
    final String? medicaid;
    final String? hrs;
    final String? continuousIntermittent;
    final String? sex;
    final String? rescheduledReason;
    final String? readPacketToDr;
    final dynamic reportFaxed;
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
    final dynamic datePruningCompleted;
    final dynamic rescheduledDateSetup;
    final dynamic rescheduledDateDisconnect;
    final dynamic datePaymentReceived;
    final String? patientJournal;
    final dynamic foldersCreated;
    final dynamic prunerNotificationSent;
    final dynamic datePrunerPaid;
    final String? carrier;
    final String? streetAddress;
    final String? city;
    final String? state;
    final String? zip;
    final String? monitoringShift;
    final String? invoice;
    final int? amountReceived;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? doctorId;
    final List<FileElement>? files;

    Payload({
        this.id,
        this.userId,
        this.firstName,
        this.lastName,
        this.mi,
        this.patientId,
        this.dob,
        this.dateReceived,
        this.requestingPhysician,
        this.practiceId,
        this.primaryInsurance,
        this.secondaryInsurance,
        this.dateHookup,
        this.dateDisconnect,
        this.medicaid,
        this.hrs,
        this.continuousIntermittent,
        this.sex,
        this.rescheduledReason,
        this.readPacketToDr,
        this.reportFaxed,
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
        this.datePruningCompleted,
        this.rescheduledDateSetup,
        this.rescheduledDateDisconnect,
        this.datePaymentReceived,
        this.patientJournal,
        this.foldersCreated,
        this.prunerNotificationSent,
        this.datePrunerPaid,
        this.carrier,
        this.streetAddress,
        this.city,
        this.state,
        this.zip,
        this.monitoringShift,
        this.invoice,
        this.amountReceived,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.doctorId,
        this.files,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mi: json["mi"],
        patientId: json["patient_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        dateReceived: json["date_received"],
        requestingPhysician: json["requesting_physician"],
        practiceId: json["practice_id"],
        primaryInsurance: json["primary_insurance"],
        secondaryInsurance: json["secondary_insurance"],
        dateHookup: json["date_hookup"],
        dateDisconnect: json["date_disconnect"],
        medicaid: json["medicaid"],
        hrs: json["hrs"],
        continuousIntermittent: json["continuous_intermittent"],
        sex: json["sex"],
        rescheduledReason: json["rescheduled_reason"],
        readPacketToDr: json["read_packet_to_dr"],
        reportFaxed: json["report_faxed"],
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
        datePruningCompleted: json["date_pruning_completed"],
        rescheduledDateSetup: json["rescheduled_date_setup"],
        rescheduledDateDisconnect: json["rescheduled_date_disconnect"],
        datePaymentReceived: json["date_payment_received"],
        patientJournal: json["patient_journal"],
        foldersCreated: json["folders_created"],
        prunerNotificationSent: json["pruner_notification_sent"],
        datePrunerPaid: json["date_pruner_paid"],
        carrier: json["carrier"],
        streetAddress: json["street_address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        monitoringShift: json["monitoring_shift"],
        invoice: json["invoice"],
        amountReceived: json["amount_received"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        doctorId: json["doctor_id"],
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "mi": mi,
        "patient_id": patientId,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "date_received": dateReceived,
        "requesting_physician": requestingPhysician,
        "practice_id": practiceId,
        "primary_insurance": primaryInsurance,
        "secondary_insurance": secondaryInsurance,
        "date_hookup": dateHookup,
        "date_disconnect": dateDisconnect,
        "medicaid": medicaid,
        "hrs": hrs,
        "continuous_intermittent": continuousIntermittent,
        "sex": sex,
        "rescheduled_reason": rescheduledReason,
        "read_packet_to_dr": readPacketToDr,
        "report_faxed": reportFaxed,
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
        "date_pruning_completed": datePruningCompleted,
        "rescheduled_date_setup": rescheduledDateSetup,
        "rescheduled_date_disconnect": rescheduledDateDisconnect,
        "date_payment_received": datePaymentReceived,
        "patient_journal": patientJournal,
        "folders_created": foldersCreated,
        "pruner_notification_sent": prunerNotificationSent,
        "date_pruner_paid": datePrunerPaid,
        "carrier": carrier,
        "street_address": streetAddress,
        "city": city,
        "state": state,
        "zip": zip,
        "monitoring_shift": monitoringShift,
        "invoice": invoice,
        "amount_received": amountReceived,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor_id": doctorId,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
    };
}

class FileElement {
    final int? id;
    final int? patientId;
    final String? fileName;
    final String? fileAddress;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    FileElement({
        this.id,
        this.patientId,
        this.fileName,
        this.fileAddress,
        this.createdAt,
        this.updatedAt,
    });

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        patientId: json["patient_id"],
        fileName: json["file_name"],
        fileAddress: json["file_address"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "file_name": fileName,
        "file_address": fileAddress,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
