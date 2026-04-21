set(
  MEMCHECK_OPTIONS 
  "--tool=memcheck"
  "--leak-check=full"
  "--error-exitcode=1"
  "--errors-for-leak-kinds=all"
  "--show-leak-kinds=all"
)

function(add_valgrind_test TARGET_NAME)

  message(DEBUG "add_valgrind_test call:")
  message(DEBUG "\tTARGET_NAME:           \"${TARGET_NAME}\"")
  message(DEBUG "\tMEMCHECK:              \"${MEMCHECK}\"")
  message(DEBUG "\tMEMCHECK_OPTIONS:      \"${MEMCHECK_OPTIONS}\"")

  if(NOT MEMCHECK)
    message(FATAL_ERROR "\"valgrind\" binary not found / forgot to find. Required for testing purposes. Please install it, find it and try again!")
  endif()
  
  # Add the test
  add_test(
    NAME "${TARGET_NAME}"
    COMMAND ${MEMCHECK} ${MEMCHECK_OPTIONS} $<TARGET_FILE:${TARGET_NAME}>
  )
endfunction()
