//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <formcraft/formcraft_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) formcraft_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FormcraftPlugin");
  formcraft_plugin_register_with_registrar(formcraft_registrar);
}
