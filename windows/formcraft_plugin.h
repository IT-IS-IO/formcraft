#ifndef FLUTTER_PLUGIN_FORMCRAFT_PLUGIN_H_
#define FLUTTER_PLUGIN_FORMCRAFT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace formcraft {

class FormcraftPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FormcraftPlugin();

  virtual ~FormcraftPlugin();

  // Disallow copy and assign.
  FormcraftPlugin(const FormcraftPlugin&) = delete;
  FormcraftPlugin& operator=(const FormcraftPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace formcraft

#endif  // FLUTTER_PLUGIN_FORMCRAFT_PLUGIN_H_
