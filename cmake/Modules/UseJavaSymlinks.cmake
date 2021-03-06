#.rst:
# UseJavaSymlinks
# ---------------
#
#
#
#
#
# Helper script for UseJava.cmake

#=============================================================================
# Copyright 2010-2011 Andreas schneider <asn@redhat.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the names of Kitware, Inc., the Insight Software Consortium,
#   nor the names of their contributors may be used to endorse or promote
#   products derived from this software without specific prior written
#   permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#=============================================================================

if (UNIX AND _JAVA_TARGET_OUTPUT_LINK)
    if (_JAVA_TARGET_OUTPUT_NAME)
        find_program(LN_EXECUTABLE
            NAMES
                ln
        )

        execute_process(
            COMMAND ${LN_EXECUTABLE} -sf "${_JAVA_TARGET_OUTPUT_NAME}" "${_JAVA_TARGET_OUTPUT_LINK}"
            WORKING_DIRECTORY ${_JAVA_TARGET_DIR}
        )
    else ()
        message(SEND_ERROR "FATAL: Can't find _JAVA_TARGET_OUTPUT_NAME")
    endif ()
endif ()
