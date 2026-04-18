set(
  COMPILER_OPTIONS
  "-Xcompiler=-Wall"
  "-Xcompiler=-Wextra"
  "-Xcompiler=-Werror"
  "-Xcompiler=-Weffc++"
  "-Xcompiler=-Wconversion"
  "-Xcompiler=-Wsign-conversion"
  "-Wno-deprecated-gpu-targets"
)



function(add_cuda_compile_options TARGET_NAME)

  message(DEBUG "add_cuda_compile_options call:")
  message(DEBUG "\tTARGET_NAME:           \"${TARGET_NAME}\"")
  message(DEBUG "\tCOMPILER_OPTIONS:      \"${COMPILER_OPTIONS}\"")

  target_compile_options(${TARGET_NAME} PRIVATE
    $<$<COMPILE_LANGUAGE:CUDA>:${COMPILER_OPTIONS}>
  )
endfunction()
