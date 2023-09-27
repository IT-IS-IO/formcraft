import 'package:flutter_test/flutter_test.dart';
import 'package:formcraft/formcraft.dart';
import 'package:formcraft/formcraft_platform_interface.dart';
import 'package:formcraft/formcraft_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFormcraftPlatform
    with MockPlatformInterfaceMixin
    implements FormcraftPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FormcraftPlatform initialPlatform = FormcraftPlatform.instance;

  test('$MethodChannelFormcraft is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFormcraft>());
  });

  test('getPlatformVersion', () async {
    Formcraft formcraftPlugin = Formcraft();
    MockFormcraftPlatform fakePlatform = MockFormcraftPlatform();
    FormcraftPlatform.instance = fakePlatform;

    expect(await formcraftPlugin.getPlatformVersion(), '42');
  });
}
