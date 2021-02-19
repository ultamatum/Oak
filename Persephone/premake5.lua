project "Persephone"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
	}

	defines
	{
		"_SILENCE_CXX17_RESULT_OF_DEPRECATION_WARNING"
	}

	includedirs
	{
		"%{wks.location}/Juno/vendor/spdlog/include",
		"%{wks.location}/Juno/src",
		"%{wks.location}/Juno/vendor",
		"%{IncludeDir.glm}",
		"%{IncludeDir.entt}",
		"%{IncludeDir.ImGuizmo}"
	}

	links
	{
		"Juno"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "JUNO_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "JUNO_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "JUNO_DIST"
		runtime "Release"
		optimize "on"