import 'package:get/get.dart';

import '../presentation/shared/single_button_dialog.dart';

class ErrorDialog {
  static Future<void> show(String error) async {
    if (Get.isDialogOpen != true) {
      await Get.dialog<void>(SingleButtonDialog(
        titleText: 'Error',
        contentText: error,
        acceptText: 'Ok',
        onAcceptTap: Get.back,
      ));
    }
  }

  static void hide() => Get.back<void>();
}
