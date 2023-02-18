import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> getStoragePermission() async {
    Map<Permission,PermissionStatus> permission1 = await [Permission.storage].request();
    Map<Permission,PermissionStatus> permission2 = await [Permission.manageExternalStorage].request();
    bool isExternalStorage = await Permission.manageExternalStorage.isGranted;
    bool isStorage= await Permission.storage.isGranted;
    print('isExternalStorage--->$isExternalStorage');
    print('isStorage--->$isStorage');

    print('Permission.manageExternalStorage.isGranted');
    if (await Permission.manageExternalStorage.isGranted) {
      print('permission----> passed');
      return true;
    } else {
      print('permission----> unpassed');
      return false;
    }
  }
}
