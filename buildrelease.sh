#!/bin/bash

if [ "x${1}x" == "xx" ]; then
	echo "Version number required."
	exit 1
fi

rm -Rf GameData
rm -Rf dev

mkdir dev
mkdir release
mkdir -p GameData/ConnectedLivingSpace/assets
mkdir -p GameData/ConnectedLivingSpace/Plugins


cp assets/* GameData/ConnectedLivingSpace/assets
cp configs/* GameData/ConnectedLivingSpace/Plugins

cp plugins/CLSInterfaces/bin/Release/CLSInterfaces.dll GameData/ConnectedLivingSpace/Plugins
cp plugins/ConnectedLivingSpace/bin/Release/ConnectedLivingSpace.dll GameData/ConnectedLivingSpace/Plugins

cp plugins/CLSInterfaces/bin/Release/CLSInterfaces.dll dev
cp plugins/CLSInterfaces/CLSClient.cs dev

rm -Rf release/CLSv${1}.zip
zip -r release/CLSv${1}.zip dev
zip -r release/CLSv${1}.zip GameData
zip release/CLSv${1}.zip README.txt
