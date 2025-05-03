
class Status {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final NotificationPreference notificationPreference;

  Status({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.notificationPreference,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      notificationPreference:
          NotificationPreference.fromJson(json['notification_preference'][0]),
    );
  }
}

class NotificationPreference {
  final int id;
  final int userId;
  final int statusId;
  final bool viaFax;
  final bool viaEmail;
  final bool viaSms;
  final String createdAt;
  final String updatedAt;

  NotificationPreference({
    required this.id,
    required this.userId,
    required this.statusId,
    required this.viaFax,
    required this.viaEmail,
    required this.viaSms,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationPreference.fromJson(Map<String, dynamic> json) {
    return NotificationPreference(
      id: json['id'],
      userId: json['user_id'],
      statusId: json['status_id'],
      viaFax: json['via_fax'] == 1,
      viaEmail: json['via_email'] == 1,
      viaSms: json['via_sms'] == 1,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
