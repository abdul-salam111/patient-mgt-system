// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:patient/app/data/getModels/status/allStatus.dart';
// import 'package:http/http.dart' as http;
// import 'package:patient/app/resources/apiKeys.dart';
// import 'package:patient/app/resources/storageServices.dart';

// class AllStatusRepository {
//   List datas = [];
//   var statusesList = <Status>[].obs;
//   Future getAllStatus() async {
//     // try {
//     EasyLoading.show();
//     final response = await http.get(Uri.parse(fetchAllStatusesUrl), headers: {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
//     });

//     if (response.statusCode == 200) {
//       EasyLoading.dismiss();
//       var data = jsonDecode(response.body);
//       AllStatus statuses = AllStatus.fromJson(data);
//       // AllStatus.assignAll(statuses.statuses);
//       print(data);
//       datas.addAll(data);

//       return AllStatus.fromJson(data);
//     }
//     // else {
//     //   EasyLoading.dismiss();
//     //   throw Exception('Failed to load technicians');
//     // }
//     // }

//     // catch (e) {
//     //   EasyLoading.dismiss();
//     //   throw Exception('Failed to load technicians');
//     // }
//   }
// }
