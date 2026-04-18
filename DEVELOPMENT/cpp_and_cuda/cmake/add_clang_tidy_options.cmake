set(
  CLANG_TIDY_OPTIONS
  "-header-filter=./include/"
  "-checks=*"
  "-warnings-as-errors=*"
)



function(add_clang_tidy_options)

  message(DEBUG "add_cuda_compile_options call:")
  message(DEBUG "\tTARGET_NAME:           \"${TARGET_NAME}\"")
  message(DEBUG "\tCLANG_TIDY_OPTIONS:    \"${CLANG_TIDY_OPTIONS}\"")
  set(CMAKE_CXX_CLANG_TIDY clang-tidy; ${CLANG_TIDY_OPTIONS})

endfunction()
