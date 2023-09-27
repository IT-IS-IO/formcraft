import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'formcraft_platform_interface.dart';

/// An implementation of [FormcraftPlatform] that uses method channels.
class MethodChannelFormcraft extends FormcraftPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('formcraft');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
