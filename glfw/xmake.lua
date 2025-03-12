target("glfw")
  set_kind("shared")

  add_includedirs("vendor/glfw/include")

  add_files("vendor/glfw/src/context.c")
  add_files("vendor/glfw/src/init.c")
  add_files("vendor/glfw/src/input.c")
  add_files("vendor/glfw/src/monitor.c")
  add_files("vendor/glfw/src/vulkan.c")
  add_files("vendor/glfw/src/window.c")
  add_files("vendor/glfw/src/egl_context.c")
  add_files("vendor/glfw/src/osmesa_context.c")
  add_files("vendor/glfw/src/platform.c")
  add_files("vendor/glfw/src/null_*.c")

  if is_plat("windows") then
    add_defines("_GLFW_WIN32")
    add_files("vendor/glfw/src/win32_*.c")
    add_files("vendor/glfw/src/wgl_context.c")
    add_syslinks("gdi32", "user32", "shell32", "ole32")
  end

  if is_plat("macosx") then
    add_defines("_GLFW_COCOA")
    add_files("vendor/glfw/src/cocoa_*.m")
    add_files("vendor/glfw/src/cocoa_*.c")
    add_files("vendor/glfw/src/nsgl_context.m")
    add_files("vendor/glfw/src/posix_*.c")
    add_frameworks("Cocoa", "IOKit", "CoreFoundation", "CoreVideo")
    add_mflags("-fno-objc-arc")
  end

  if is_plat("linux") then
        add_defines("_GLFW_X11")
        add_files("vendor/glfw/src/x11_*.c")
        add_files("vendor/glfw/src/glx_context.c")
        add_files("vendor/glfw/src/posix_*.c")
        add_files("vendor/glfw/src/xkb_*.c")
        add_syslinks("dl", "pthread", "m")

        add_defines("_GLFW_WAYLAND")
        add_files("vendor/glfw/src/wl_*.c")
        add_files("vendor/glfw/src/posix_*.c")
        add_files("vendor/glfw/src/xkb_*.c")
        add_syslinks("dl", "pthread", "m")
  end
