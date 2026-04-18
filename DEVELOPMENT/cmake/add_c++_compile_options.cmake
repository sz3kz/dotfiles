set(
  COMPILER_OPTIONS
  "-Wall"
  "-Wextra"
  "-Werror"
  "-Weffc++"
  "-Wconversion"
  "-Wsign-conversion"
  "-Wpedantic"
  "-Wno-error=pedantic"
)



function(add_c++_compile_options TARGET_NAME)

  message(DEBUG "add_c++_compile_options call:")
  message(DEBUG "\tTARGET_NAME:           \"${TARGET_NAME}\"")
  message(DEBUG "\tCOMPILER_OPTIONS:      \"${COMPILER_OPTIONS}\"")

  target_compile_options(TARGET_NAME PRIVATE
    $<$<COMPILE_LANGUAGE:CXX>:${COMPILER_OPTIONS}>
  )
endfunction()
