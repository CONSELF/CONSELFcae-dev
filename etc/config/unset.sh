#----------------------------------*-sh-*--------------------------------------
# =========                 |
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
#  \\    /   O peration     |
#   \\  /    A nd           | Copyright (C) 2011-2016 OpenFOAM Foundation
#    \\/     M anipulation  |
#------------------------------------------------------------------------------
# License
#     This file is part of OpenFOAM.
#
#     OpenFOAM is free software: you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
#     ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#     FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.
#
# File
#     etc/config/unset.sh
#
# Description
#     Clear as many OpenFOAM environment settings as possible
#
#------------------------------------------------------------------------------

# Clean standard environment variables (PATH, LD_LIBRARY_PATH, MANPATH)
foamClean=$WM_PROJECT_DIR/bin/foamCleanPath
[ -f "$foamClean" -a -x "$foamClean" ] || unset foamClean

# The old dirs to be cleaned from the environment variables
foamOldDirs="$WM_PROJECT_DIR $WM_THIRD_PARTY_DIR $HOME/$WM_PROJECT/$USER \
    $WM_PROJECT_SITE $FOAM_SITE_APPBIN $FOAM_SITE_LIBBIN $ParaView_DIR"

#------------------------------------------------------------------------------
# Unset WM_* environment variables

unset WM_ARCH
unset WM_ARCH_OPTION
unset WM_CC
unset WM_CFLAGS
unset WM_COMPILER
unset WM_COMPILER_TYPE
unset WM_COMPILER_LIB_ARCH
unset WM_COMPILE_OPTION
unset WM_CXX
unset WM_CXXFLAGS
unset WM_DIR
unset WM_HOSTS
unset WM_LABEL_OPTION
unset WM_LABEL_SIZE
unset WM_LDFLAGS
unset WM_LINK_LANGUAGE
unset WM_MPLIB
unset WM_NCOMPPROCS
unset WM_OPTIONS
unset WM_OSTYPE
unset WM_PRECISION_OPTION
unset WM_PROJECT
unset WM_PROJECT_DIR
unset WM_PROJECT_INST_DIR
unset WM_PROJECT_SITE
unset WM_PROJECT_USER_DIR
unset WM_PROJECT_VERSION
unset WM_SCHEDULER
unset WM_THIRD_PARTY_DIR


#------------------------------------------------------------------------------
# Unset FOAM_* environment variables

unset FOAM_APPBIN
unset FOAM_APP
unset FOAM_EXT_LIBBIN
unset FOAM_CODE_TEMPLATES
unset FOAM_INST_DIR
unset FOAM_JOB_DIR
unset FOAM_LIBBIN
unset FOAM_MPI
unset FOAM_RUN
unset FOAM_SETTINGS
unset FOAM_SIGFPE
unset FOAM_SIGNAN
unset FOAM_SITE_APPBIN
unset FOAM_SITE_LIBBIN
unset FOAM_SOLVERS
unset FOAM_SRC
unset FOAM_TUTORIALS
unset FOAM_USER_APPBIN
unset FOAM_USER_LIBBIN
unset FOAM_UTILITIES


#------------------------------------------------------------------------------
# Unset MPI-related environment variables

unset MPI_ARCH_PATH
unset MPI_BUFFER_SIZE
unset OPAL_PREFIX


#------------------------------------------------------------------------------
# Unset Ensight/ParaView-related environment variables

unset ENSIGHT9_READER
unset CMAKE_HOME
unset ParaView_DIR
unset ParaView_INCLUDE_DIR
unset ParaView_MAJOR
unset ParaView_VERSION
unset PV_PLUGIN_PATH


#------------------------------------------------------------------------------
# Unset CGAL-related environment variables

unset CGAL_ARCH_PATH


#------------------------------------------------------------------------------
# Cleanup environment
# PATH, LD_LIBRARY_PATH, MANPATH

if [ -n "$foamClean" ]
then
    cleaned=`$foamClean "$PATH" "$foamOldDirs"` && PATH="$cleaned"
    cleaned=`$foamClean "$LD_LIBRARY_PATH" "$foamOldDirs"` && LD_LIBRARY_PATH="$cleaned"
    cleaned=`$foamClean "$MANPATH" "$foamOldDirs"` && MANPATH="$cleaned"
fi


[ -n "$LD_LIBRARY_PATH" ] || unset LD_LIBRARY_PATH
[ -n "$MANPATH" ] || unset MANPATH
[ -n "$LD_PRELOAD" ] || unset LD_PRELOAD


unset cleaned foamClean foamOldDirs


#------------------------------------------------------------------------------
# Cleanup aliases

unalias wmSet
unalias wm64
unalias wm32
unalias wmSP
unalias wmDP

unalias wmUnset

unalias wmSchedOn
unalias wmSchedOff

unalias foam
unalias foamSite

unalias src
unalias lib
unalias app
unalias sol
unalias util
unalias tut
unalias run

unset foamVersion
unset foamPV


#------------------------------------------------------------------------------
