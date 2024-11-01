# Kullanıcıdan proje oluştururken template ve platform seçmesini isteyen bir fonksiyon
flutter-create-project(){
    # Kullanıcıdan template seçimi alınır
    echo "Lütfen --template parametresi için bir seçim yapın:"
    echo "   [app] - (default) Bir Flutter uygulaması oluşturun."
    echo "   [module] - Mevcut bir Android veya iOS uygulamasına Flutter modülü eklemek için bir proje oluşturun."
    echo "   [package] - Modüler Dart kodunu içeren paylaşılabilir bir Flutter projesi oluşturun."
    echo "   [plugin] - Dart kodunda ve platforma-özel method kanallarında bir API ile paylaşılabilir bir Flutter projesi oluşturun."
    echo "   [plugin_ffi] - Dart kodundaki bir API ve platforma-özel FFI uygulamalarıyla paylaşılabilir bir Flutter projesi oluşturun."
    echo "   [skeleton] - En iyi uygulamalara göre hazırlanmış bir ListView / DetailView Flutter uygulaması oluştur.\n"
    read -p "Seçiminizi yapın (varsayılan: app): " template_choice

    # eğer kullanıcı boş bırakırsa varsayılan değer 'app' olarak ayarlanır
    case "$template_choice" in
        1|"") template="app" ;;
        2) template="module" ;;
        3) template="package" ;;
        4) template="plugin" ;;
        5) template="plugin_ffi" ;;
        6) template="skeleton" ;;
        *) echo "Geçersiz seçim! Varsayılan olarak 'app' template'i kullanılacak."; template="app" ;;
    esac

    # Kullanıcıdan platformlar seçimi alınır
    echo "Lütfen --platforms parametresi için bir veya daha fazla seçim yapın:"
    echo "1.   [hepsi] - tüm platformlar için (ios,android,web,macos,linux,windows) kurulumları yapar."
    echo "2.   [ios] - ios platformu için kurulumları yapar."
    echo "3.   [android] - android platformu için kurulumları yapar."
    echo "4.   [web] - web platformu için kurulumları yapar."
    echo "5.   [macos] - macos platformu için kurulumları yapar."
    echo "6.   [linux] - linux platformu için kurulumları yapar."
    echo "7.   [windows] - windows platformu için kurulumları yapar.\n"
    read -p "Seçiminizi yapın (varsayılan: ios,android,web,macos,linux,windows): " platforms_choice

    # eğer kullanıcı boş bırakırsa varsayılan değer 'hepsi' olarak ayarlanır
    case "$platforms_choice" in
        1|"") platforms="ios,android,web,macos,linux,windows" ;;
        2) platforms="ios" ;;
        3) platforms="android" ;;
        4) platforms="web" ;;
        5) platforms="macos" ;;
        6) platforms="linux" ;;
        7) platforms="windows" ;;
        *) echo "Geçersiz seçim! Varsayılan olarak 'ios,android,web,macos,linux,windows' platformları kullanılacak."; platforms="ios,android,web,macos,linux,windows" ;;
    esac

    # ilk parametreyi geç
    shift
    # projeyi oluştur
    flutter create --org=com.tutkuns.apps --platforms="$platforms" --template="$template" -e --project-name "$@"
}
