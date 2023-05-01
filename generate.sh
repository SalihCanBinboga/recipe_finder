cd modules || exit
for d in **/; do
    cd "$d" || exit
    echo "$d"
    #flutter pub get
    flutter packages pub run build_runner build --delete-conflicting-outputs
    echo "\n"
    cd ..
done