flutter packages pub run build_runner build --delete-conflicting-outputs
cd modules/domain || exit
flutter packages pub run build_runner build --delete-conflicting-outputs
cd ../data || exit
flutter packages pub run build_runner build --delete-conflicting-outputs
