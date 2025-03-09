add_rules("mode.debug", "mode.release")

set_project("game-native-builds")

set_xmakever("2.8.2")

set_warnings("all", "error")

includes("imgui_bindings")
