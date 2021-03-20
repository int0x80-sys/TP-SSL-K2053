solution "TP-SSL"
    configurations {"Debug", "Release"}

project "TP0"
    kind "ConsoleApp"
    language "C"
    location "TP0"
    targetname "main"
    includedirs {"TP0/include"}
    files {
        "TP0/include/*.h",
        "TP0/src/*.c"
    }

    configuration "Debug"
        targetdir "TP0/bin/Debug"
        objdir "TP0/obj/Debug"
        buildoptions {"-g", "-std=gnu89", "-Wall", "-Werror", "-Wno-switch"}
        
    configuration "Release"
        targetdir "TP0/bin/Release"
        objdir "TP0/obj/Release"
        buildoptions {"-O3", "-Wno-unused-result", "-std=gnu89"}