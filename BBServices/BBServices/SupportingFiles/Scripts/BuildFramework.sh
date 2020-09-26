#!/bin/sh

#  BuildFramework.sh
#  BBServices
#
#  Created by Nitin kachhadiya on 26/09/20.
#  Copyright © 2020 Nitin kachhadiya. All rights reserved.

set -e

# If we're already inside this script then die
if [ -n "$RW_MULTIPLATFORM_BUILD_IN_PROGRESS" ]; then
exit 0
fi
export RW_MULTIPLATFORM_BUILD_IN_PROGRESS=1

rm -rf "./Services.framework"

source $(pwd)"/BBServices/SupportingFiles/Scripts/Utility.sh"
createFatLibrary "BBServices" "./BBServices.xcodeproj" "./" "Release"
