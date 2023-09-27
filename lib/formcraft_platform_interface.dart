import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'formcraft_method_channel.dart';

abstract class FormcraftPlatform extends PlatformInterface {
  /// Constructs a FormcraftPlatform.
  FormcraftPlatform() : super(token: _token);

  static final Object _token = Object();

  static FormcraftPlatform _instance = MethodChannelFormcraft();

  /// The default instance of [FormcraftPlatform] to use.
  ///
  /// Defaults to [MethodChannelFormcraft].
  static FormcraftPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FormcraftPlatform] when
  /// they register themselves.
  static set instance(FormcraftPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
