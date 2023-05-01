flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs

cd modules/domain || exit
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs

cd ../data || exit
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs

cd ../presentation || exit
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs

cd ../core || exit
flutter pub get
