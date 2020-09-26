#!/bin/sh

#  Utility.sh
#  BBServices
#
#  Created by Nitin kachhadiya on 26/09/20.
#  Copyright © 2020 Nitin kachhadiya. All rights reserved.

#===========================================
# This method will create framework in output directory of particular project.
#
# param 1: Scheme,
# Param 2: Project file path
# Param 3: Framework path
# Param 4: Configuration
#
# Output: Create fat framework in particular architecture in output directory.
#===========================================

function createFatLibrary {

SCHEME=$1
PROJECT=$2
FRAMEWORK_PATH=$3
CONFIGURATION=$4

echo "-------------------------------------------"
echo ${FRAMEWORK_PATH}
echo "-------------------------------------------"

echo "-------------------------------------------"
echo ${FRAMEWORK_PATH}
echo "-------------------------------------------"

buildFramework $SCHEME iphoneos $PROJECT $FRAMEWORK_PATH $CONFIGURATION
buildFramework $SCHEME iphonesimulator $PROJECT $FRAMEWORK_PATH $CONFIGURATION

DEVICE_FRAMEWORK=$FRAMEWORK_PATH"/"$SCHEME"-iphoneos.framework"
SIMULATOR_FRAMEWORK=$FRAMEWORK_PATH"/"$SCHEME"-iphonesimulator.framework"

DESTINATION_PATH=$FRAMEWORK_PATH"/"$SCHEME"-universal.framework"
cp -R $DEVICE_FRAMEWORK $DESTINATION_PATH

SIMULATOR_SWIFT_MODULES_DIR="$SIMULATOR_FRAMEWORK/Modules/${SCHEME}.swiftmodule/."
if [ -d "${SIMULATOR_SWIFT_MODULES_DIR}" ]; then
cp -R "${SIMULATOR_SWIFT_MODULES_DIR}" "$DESTINATION_PATH/Modules/${SCHEME}.swiftmodule"
fi

lipo -create "$SIMULATOR_FRAMEWORK/$SCHEME" "$DEVICE_FRAMEWORK/$SCHEME" -output "$DESTINATION_PATH/$SCHEME"

SOURCH_PATH=$FRAMEWORK_PATH"/"$SCHEME"-universal.framework"
DESTINATION_PATH=$FRAMEWORK_PATH"/$SCHEME.framework"

mv $SOURCH_PATH $DESTINATION_PATH
rm -rf $DEVICE_FRAMEWORK
rm -rf $SIMULATOR_FRAMEWORK
}


#===========================================
# This method will build framework base on SDK type i.e. which architecture in output directory of particular project.
#
# param 1: Scheme,
# Param 2: sdk type (iphoneos/iphonesimulator)
# Param 3: Project file path
# Param 4: Framework path
# Param 5: Configuration
#
# Output: Create framework in particular architecture in output directory.
#===========================================

function buildFramework {

SCHEME=$1
SDK_TYPE=$2
PROJECT=$3
FRAMEWORK_PATH=$4
CONFIGURATION=$5

SOURCH_PATH=$BUILD_DIR"/"$CONFIGURATION"-"$SDK_TYPE"/$SCHEME.framework"
DESTINATION_PATH=$FRAMEWORK_PATH"/"$SCHEME"-"$SDK_TYPE".framework"

xcodebuild -project $PROJECT -scheme $SCHEME ONLY_ACTIVE_ARCH=NO -configuration $CONFIGURATION -sdk $SDK_TYPE -UseModernBuildSystem=NO

mv $SOURCH_PATH $DESTINATION_PATH
}

function buildWorkspaceFramework {

SCHEME=$1
SDK_TYPE=$2
PROJECT=$3
FRAMEWORK_PATH=$4
CONFIGURATION=$5

SOURCH_PATH=$BUILD_DIR"/"$CONFIGURATION"-"$SDK_TYPE"/$SCHEME.framework"
DESTINATION_PATH=$FRAMEWORK_PATH"/"$SCHEME"-"$SDK_TYPE".framework"

xcodebuild -workspace $PROJECT -verbose -scheme $SCHEME ONLY_ACTIVE_ARCH=NO -configuration $CONFIGURATION -sdk $SDK_TYPE -UseModernBuildSystem=NO

mv $SOURCH_PATH $DESTINATION_PATH
}
