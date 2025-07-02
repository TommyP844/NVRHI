project "DirectX-Headers"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",
        "src/**.cpp"
    }

    includedirs {
        "include",
        "thirdparty/DirectX-Headers/include",
        "thirdparty/Vulkan-Headers/include",
        "rtxmu/include"
    }

    links {
        "RTXMU",
        "directX-Headers"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "on"
        optimize "off"

    filter "configurations:Release"
        defines { "NDEBUG" }
        runtime "Release"
        optimize "Speed"
        symbols "off"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "Speed"
        symbols "off"


    include "rtxmu"
    include "thirdparty/DirectX-Headers"
