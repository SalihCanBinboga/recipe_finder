#!/bin/bash

# Ask for the feature name if not provided as an argument
if [ $# -eq 0 ]; then
  read -p "Enter the feature name: " feature_name
else
  feature_name=$1
fi

# Set the path to the feature folder
feature_folder="../modules/features/$feature_name"

# Create the feature folder
mkdir -p "$feature_folder"

# Run flutter create to generate the package template
flutter create --template=package "$feature_folder"

# Remove unnecessary files and folders
cd "$feature_folder" || exit
rm -rf android ios test windows macos linux README.md LICENSE analysis_options.yaml

# Update pubspec.yaml with the new feature name and dependencies
cat << EOF > pubspec.yaml
name: $feature_name
description: A new Flutter package project.
version: 0.0.1
publish_to: 'none'

environment:
  sdk: '>=3.0.3 <4.0.0'
  flutter: ">=1.17.0"

dependencies:
  flutter:
    sdk: flutter
EOF

touch index_generator.yaml

cat << EOF > index_generator.yaml
index_generator:
  exclude:
    - '**.g.dart'
EOF



# Run flutter pub get to fetch the dependencies
flutter pub get

# Create the feature folder and presentation subfolder
mkdir -p "lib/presentation"

cd "lib/presentation" || exit

# TODO: 29.07.2023 17:39 CREATE VIEW AND VIEW MODEL TEMPLATES

# Provide script execution permissions
chmod +x feature.sh

# Commit the changes to Git with the specified message
cd ../../ || exit
git add .
git commit -m "create $feature_name skeleton"
