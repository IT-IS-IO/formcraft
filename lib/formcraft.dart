
import 'formcraft_platform_interface.dart';

class Formcraft {
  Future<String?> getPlatformVersion() {
    return FormcraftPlatform.instance.getPlatformVersion();
    // test
  }
}
