workspace "Games101"
	configurations { "Debug", "Release", "Dist" }
	platforms "x64"
	architecture "x86_64"
	startproject "05"
	location "project-files"
	filter "configurations:Debug"
		defines { "CG_DEBUG" }
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		defines { "CG_RELEASE" }
		runtime "Release"
		optimize "on"
		symbols "off"
	filter "configurations:Dist"
		defines { "CG_Dist" }
		runtime "Release"
		optimize "on"
		symbols "off"
	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
project "05"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"  --dll problem
	targetdir ("bin/%{outputdir}/%{prj.name}")
	objdir ("bin-int/%{outputdir}/%{prj.name}")
	files
	{
		"05/**.cpp",
		"05/**.hpp",
		"premake5.lua"
	}
	filter "system:windows"
		includedirs {
			--"code/include/",
			--"code/",
			--"./vendor/eigen-3.4.0",
			--"C:/lib/opencv-4.9.0-windows/opencv/build/include"
		}
		libdirs { 
			--"C:/lib/opencv-4.9.0-windows/opencv/build/x64/vc16/lib"
		}
		
		filter "configurations:Debug"
			--links {
			--	"opencv_world490d.lib"
			--}
			--postbuildcommands
			--{
			--	{"{COPY} C:/lib/opencv-4.9.0-windows/opencv/build/x64/vc16/bin/opencv_world490d.dll ../bin/%{outputdir}/%{prj.name}"}
			--}

		filter "configurations:Release or Dist"
			--links {
			--	"opencv_world490.lib"
			--}
			--postbuildcommands
			--{
			--	{"{COPY} C:/lib/opencv-4.9.0-windows/opencv/build/x64/vc16/bin/opencv_world490.dll ../bin/%{outputdir}/%{prj.name}"}
			--}
