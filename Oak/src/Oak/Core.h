#pragma once

#ifdef  OK_PLATFORM_WINDOWS
	#if OK_DYNAMIC_LINK
		#ifdef OK_BUILD_DLL
			#define OAK_API __declspec(dllexport)
		#else
			#define OAK_API __declspec(dllimport)
		#endif
	#else
		#define OAK_API
	#endif
#else
	#error Oak only supports Windows!
#endif	

#ifdef OK_DEBUG
	#define OK_ENABLE_ASSERTS
#endif  

//Assertion used primarily for debugging purposes, to be disabled for end client
#ifdef OK_ENABLE_ASSERTS
	#define OK_ASSERT(x, ...) { if(!(x)) { OK_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak();}}
	#define OK_CORE_ASSERT(x, ...) { if(!(x)) { OK_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak();}}
#else
	#define OK_ASSERT(x, ...)
	#define OK_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define OK_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)