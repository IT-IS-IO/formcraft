#include "include/formcraft/formcraft_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "formcraft_plugin.h"

void FormcraftPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  formcraft::FormcraftPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
