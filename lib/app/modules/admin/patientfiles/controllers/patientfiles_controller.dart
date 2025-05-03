import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';


class PatientfilesController extends GetxController {
 Future<void> downloadAndOpenExcelFile(String urlString) async {
  try {
    // Get the application directory to save the file
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/downloaded_file.xlsx';

    // Download the file
    final dio = Dio();
    await dio.download(urlString, filePath);

    // Open the file
    final result = await OpenFilex.open(filePath);
    if (result.type != ResultType.done) {
      throw 'Could not open the file';
    }
  } catch (e) {
    throw 'Error downloading or opening file: $e';
  }
}

}
