// To parse this JSON data, do
//
//     final getAllPatientsByDoctor = getAllPatientsByDoctorFromJson(jsonString);

import 'dart:convert';

GetAllPatientsByDoctor getAllPatientsByDoctorFromJson(String str) =>
    GetAllPatientsByDoctor.fromJson(json.decode(str));

String getAllPatientsByDoctorToJson(GetAllPatientsByDoctor data) =>
    json.encode(data.toJson());

class GetAllPatientsByDoctor {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetAllPatientsByDoctor({
    this.success,
    this.message,
    this.payload,
  });

  factory GetAllPatientsByDoctor.fromJson(Map<String, dynamic> json) =>
      GetAllPatientsByDoctor(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null
            ? []
            : List<Payload>.from(
                json["payload"]!.map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload == null
            ? []
            : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  final int? id;
  final int? userId;
  final int? doctorId;
  final String? firstName;
  final String? lastName;
  final String? mi;
  final String? patientId;
  final DateTime? dob;
  final dynamic dateReceived;
  final String? requestingPhysician;
  final String? primaryInsurance;
  final String? secondaryInsurance;
  final DateTime? dateHookup;
  final DateTime? dateDisconnect;
  final String? medicaid;
  final int? hrs;
  final String? continuousIntermittent;
  final String? sex;
  final String? rescheduledReason;
  final String? medications;
  final String? contactNumber;
  final String? setupTechnician;
  final String? disconnectTechnician;
  final String? preAuthRefNbr;
  final DateTime? sbillSubmitted;
  final String? professionalComponent;
  final String? professionalComponentPractice;
  final String? pruningTechnician;
  final dynamic datePruningCompleted;
  final dynamic rescheduledDateSetup;
  final dynamic rescheduledDateDisconnect;
  final dynamic datePaymentReceived;
  final int? patientJournal;
  final dynamic prunerNotificationSent;
  final dynamic datePrunerPaid;
  final String? streetAddress;
  final String? city;
  final String? state;
  final String? zip;
  final String? monitoringShift;
  final String? invoice;
  final int? amountReceived;
  final String? status;
  final dynamic image;
  final int? disconnectAllow;
  final int? isPruning;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<FileElement>? files;
  final Doctor? doctor;

  Payload({
    this.id,
    this.userId,
    this.doctorId,
    this.firstName,
    this.lastName,
    this.mi,
    this.patientId,
    this.dob,
    this.dateReceived,
    this.requestingPhysician,
    this.primaryInsurance,
    this.secondaryInsurance,
    this.dateHookup,
    this.dateDisconnect,
    this.medicaid,
    this.hrs,
    this.continuousIntermittent,
    this.sex,
    this.rescheduledReason,
    this.medications,
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
    this.prunerNotificationSent,
    this.datePrunerPaid,
    this.streetAddress,
    this.city,
    this.state,
    this.zip,
    this.monitoringShift,
    this.invoice,
    this.amountReceived,
    this.status,
    this.image,
    this.disconnectAllow,
    this.isPruning,
    this.createdAt,
    this.updatedAt,
    this.files,
    this.doctor,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mi: json["mi"],
        patientId: json["patient_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        dateReceived: json["date_received"],
        requestingPhysician: json["requesting_physician"],
        primaryInsurance: json["primary_insurance"],
        secondaryInsurance: json["secondary_insurance"],
        dateHookup: json["date_hookup"] == null
            ? null
            : DateTime.parse(json["date_hookup"]),
        dateDisconnect: json["date_disconnect"] == null
            ? null
            : DateTime.parse(json["date_disconnect"]),
        medicaid: json["medicaid"],
        hrs: json["hrs"],
        continuousIntermittent: json["continuous_intermittent"],
        sex: json["sex"],
        rescheduledReason: json["rescheduled_reason"],
        medications: json["medications"],
        contactNumber: json["contact_number"],
        setupTechnician: json["setup_technician"],
        disconnectTechnician: json["disconnect_technician"],
        preAuthRefNbr: json["pre_auth_ref_nbr"],
        sbillSubmitted: json["sbill_submitted"] == null
            ? null
            : DateTime.parse(json["sbill_submitted"]),
        professionalComponent: json["professional_component"],
        professionalComponentPractice: json["professional_component_practice"],
        pruningTechnician: json["pruning_technician"],
        datePruningCompleted: json["date_pruning_completed"],
        rescheduledDateSetup: json["rescheduled_date_setup"],
        rescheduledDateDisconnect: json["rescheduled_date_disconnect"],
        datePaymentReceived: json["date_payment_received"],
        patientJournal: json["patient_journal"],
        prunerNotificationSent: json["pruner_notification_sent"],
        datePrunerPaid: json["date_pruner_paid"],
        streetAddress: json["street_address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        monitoringShift: json["monitoring_shift"],
        invoice: json["invoice"],
        amountReceived: json["amount_received"],
        status: json["status"],
        image: json["image"],
        disconnectAllow: json["disconnect_allow"],
        isPruning: json["is_pruning"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        files: json["files"] == null
            ? []
            : List<FileElement>.from(
                json["files"]!.map((x) => FileElement.fromJson(x))),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "first_name": firstName,
        "last_name": lastName,
        "mi": mi,
        "patient_id": patientId,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "date_received": dateReceived,
        "requesting_physician": requestingPhysician,
        "primary_insurance": primaryInsurance,
        "secondary_insurance": secondaryInsurance,
        "date_hookup":
            "${dateHookup!.year.toString().padLeft(4, '0')}-${dateHookup!.month.toString().padLeft(2, '0')}-${dateHookup!.day.toString().padLeft(2, '0')}",
        "date_disconnect":
            "${dateDisconnect!.year.toString().padLeft(4, '0')}-${dateDisconnect!.month.toString().padLeft(2, '0')}-${dateDisconnect!.day.toString().padLeft(2, '0')}",
        "medicaid": medicaid,
        "hrs": hrs,
        "continuous_intermittent": continuousIntermittent,
        "sex": sex,
        "rescheduled_reason": rescheduledReason,
        "medications": medications,
        "contact_number": contactNumber,
        "setup_technician": setupTechnician,
        "disconnect_technician": disconnectTechnician,
        "pre_auth_ref_nbr": preAuthRefNbr,
        "sbill_submitted":
            "${sbillSubmitted!.year.toString().padLeft(4, '0')}-${sbillSubmitted!.month.toString().padLeft(2, '0')}-${sbillSubmitted!.day.toString().padLeft(2, '0')}",
        "professional_component": professionalComponent,
        "professional_component_practice": professionalComponentPractice,
        "pruning_technician": pruningTechnician,
        "date_pruning_completed": datePruningCompleted,
        "rescheduled_date_setup": rescheduledDateSetup,
        "rescheduled_date_disconnect": rescheduledDateDisconnect,
        "date_payment_received": datePaymentReceived,
        "patient_journal": patientJournal,
        "pruner_notification_sent": prunerNotificationSent,
        "date_pruner_paid": datePrunerPaid,
        "street_address": streetAddress,
        "city": city,
        "state": state,
        "zip": zip,
        "monitoring_shift": monitoringShift,
        "invoice": invoice,
        "amount_received": amountReceived,
        "status": status,
        "image": image,
        "disconnect_allow": disconnectAllow,
        "is_pruning": isPruning,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "files": files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toJson())),
        "doctor": doctor?.toJson(),
      };
}

class Doctor {
  final int? id;
  final String? name;
  final String? userName;
  final String? email;
  final String? phone;
  final String? fax;
  final dynamic emailVerifiedAt;
  final String? originalPassword;
  final DateTime? date;
  final int? practiceId;
  final dynamic assignedDoctorId;
  final String? fillOutForm;
  final String? status;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic doctorId;

  Doctor({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.fax,
    this.emailVerifiedAt,
    this.originalPassword,
    this.date,
    this.practiceId,
    this.assignedDoctorId,
    this.fillOutForm,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.doctorId,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        email: json["email"],
        phone: json["phone"],
        fax: json["fax"],
        emailVerifiedAt: json["email_verified_at"],
        originalPassword: json["original_password"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        practiceId: json["practice_id"],
        assignedDoctorId: json["assigned_doctor_id"],
        fillOutForm: json["fill_out_form"],
        status: json["status"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctorId: json["doctor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "email": email,
        "phone": phone,
        "fax": fax,
        "email_verified_at": emailVerifiedAt,
        "original_password": originalPassword,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "practice_id": practiceId,
        "assigned_doctor_id": assignedDoctorId,
        "fill_out_form": fillOutForm,
        "status": status,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor_id": doctorId,
      };
}

class FileElement {
  final int? id;
  final int? patientId;
  final String? fileName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? xlsxFileAddress;
  final String? pdfFileAddress;

  FileElement({
    this.id,
    this.patientId,
    this.fileName,
    this.createdAt,
    this.updatedAt,
    this.xlsxFileAddress,
    this.pdfFileAddress,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        patientId: json["patient_id"],
        fileName: json["file_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        xlsxFileAddress: json["xlsx_file_address"],
        pdfFileAddress: json["pdf_file_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "file_name": fileName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "xlsx_file_address": xlsxFileAddress,
        "pdf_file_address": pdfFileAddress,
      };
}
