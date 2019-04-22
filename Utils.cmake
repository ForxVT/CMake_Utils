#==================================================================================#
#                                                                                  #
#  Copyright (c) 2019 Hugo Kindel <kindelhugo@gmail.com>                           #
#                                                                                  #
#  This file is part of the Aesir project.                                         #
#  Licensed under MIT License:                                                     #
#                                                                                  #
#  Permission is hereby granted, free of charge, to any person obtaining           #
#  a copy of this software and associated documentation files (the "Software"),    #
#  to deal in the Software without restriction, including without limitation       #
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,        #
#  and/or sell copies of the Software, and to permit persons to whom the           #
#  Software is furnished to do so, subject to the following conditions:            #
#                                                                                  #
#  The above copyright notice and this permission notice shall be included in      #
#  all copies or substantial portions of the Software.                             #
#                                                                                  #
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      #
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        #
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     #
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          #
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   #
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   #
#  SOFTWARE.                                                                       #
#                                                                                  #
#==================================================================================#

function (addCompileDefinitionsForBuildType)
    string(TOLOWER ${CMAKE_BUILD_TYPE} TEMP_BUILD_TYPE)

    if(${TEMP_BUILD_TYPE} STREQUAL debug)
        add_compile_definitions(_DEBUG)
        add_compile_definitions(DEBUG)
        add_compile_definitions(CONFIGURATION_DEBUG)
    else()
        add_compile_definitions(_RELEASE)
        add_compile_definitions(RELEASE)
        add_compile_definitions(CONFIGURATION_RELEASE)
    endif()
endfunction()

function (addCompileDefinitionsForCompilerType)
    string(TOLOWER ${CMAKE_CXX_COMPILER_ID} TEMP_COMPILER_TYPE)

    if(${TEMP_COMPILER_TYPE} STREQUAL gnu)
        add_compile_definitions(_GNU)
        add_compile_definitions(GNU)
        add_compile_definitions(COMPILER_GNU)
    elseif(${TEMP_COMPILER_TYPE} STREQUAL clang)
        add_compile_definitions(_CLANG)
        add_compile_definitions(CLANG)
        add_compile_definitions(COMPILER_CLANG)
    elseif(${TEMP_COMPILER_TYPE} STREQUAL intel)
        add_compile_definitions(_INTEL)
        add_compile_definitions(INTEL)
        add_compile_definitions(COMPILER_INTEL)
    elseif(${TEMP_COMPILER_TYPE} STREQUAL msvc)
        add_compile_definitions(_MSVC)
        add_compile_definitions(MSVC)
        add_compile_definitions(COMPILER_MSVC)
    endif()
endfunction()

function (addCompileDefinitionsForPlatformType)
    if(WIN32)
        add_compile_definitions(_WIN32)
        add_compile_definitions(WIN32)
        add_compile_definitions(PLATFORM_WINDOWS)
    elseif(APPLE)
        add_compile_definitions(_APPLE)
        add_compile_definitions(APPLE)
        add_compile_definitions(PLATFORM_MACOSX)
    elseif(UNIX)
        add_compile_definitions(_UNIX)
        add_compile_definitions(UNIX)
        add_compile_definitions(PLATFORM_LINUX)
    endif()
endfunction()

function (addDefaultCompileDefinitions)
    addCompileDefinitionsForBuildType()
    addCompileDefinitionsForCompilerType()
    addCompileDefinitionsForPlatformType()
endfunction()

function (defineCppStandards)
    set(CMAKE_CXX_STANDARD 17 PARENT_SCOPE)
    set(CMAKE_CXX_STANDARD_REQUIRED ON PARENT_SCOPE)
    set(CMAKE_CXX_EXTENSIONS OFF PARENT_SCOPE)
endfunction()