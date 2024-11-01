# Kullanıcıdan proje oluştururken template ve platform seçmesini isteyen bir fonksiyon
flutter-create-project(){
    # Kullanıcıdan template seçimi alınır
    echo "Lütfen --template parametresi için bir seçim yapın:"
    echo "   [app] - (varsayılan) Bir Flutter uygulaması oluşturun."
    echo "   [module] - Mevcut bir Android veya iOS uygulamasına Flutter modülü eklemek için bir proje oluşturun."
    echo "   [package] - Modüler Dart kodunu içeren paylaşılabilir bir Flutter projesi oluşturun."
    echo "   [plugin] - Dart kodunda ve platforma-özel method kanallarında bir API ile paylaşılabilir bir Flutter projesi oluşturun."
    echo "   [plugin_ffi] - Dart kodundaki bir API ve platforma-özel FFI uygulamalarıyla paylaşılabilir bir Flutter projesi oluşturun."
    echo "   [skeleton] - En iyi uygulamalara göre hazırlanmış bir ListView / DetailView Flutter uygulaması oluştur."
    echo -n "Seçiminizi yapın (varsayılan: app): "
    read template_choice

    # eğer kullanıcı boş bırakırsa varsayılan değer 'app' olarak ayarlanır
    case "$template_choice" in
        ""|"app") template="app" ;;
        "module") template="module" ;;
        "package") template="package" ;;
        "plugin") template="plugin" ;;
        "plugin_ffi") template="plugin_ffi" ;;
        "skeleton") template="skeleton" ;;
        *) echo "Geçersiz seçim! Varsayılan olarak 'app' template'i kullanılacak."; template="app" ;;
    esac

    # Kullanıcıdan platformlar seçimi alınır
    echo "Lütfen --platforms parametresi için bir veya daha fazla seçim yapın:"
    echo "   [hepsi] - tüm platformlar için (ios,android,web,macos,linux,windows) kurulumları yapar."
    echo "   [ios] - ios platformu için kurulumları yapar."
    echo "   [android] - android platformu için kurulumları yapar."
    echo "   [web] - web platformu için kurulumları yapar."
    echo "   [macos] - macos platformu için kurulumları yapar."
    echo "   [linux] - linux platformu için kurulumları yapar."
    echo "   [windows] - windows platformu için kurulumları yapar."
    echo -n "Seçiminizi yapın (varsayılan: 'ios,android,web,macos,linux,windows'): "
    read platforms_choice

    # eğer kullanıcı boş bırakırsa varsayılan değer 'hepsi' olarak ayarlanır
    case "$platforms_choice" in
        ""|"hepsi") platforms="ios,android,web,macos,linux,windows" ;;
        "ios") platforms="ios" ;;
        "android") platforms="android" ;;
        "web") platforms="web" ;;
        "macos") platforms="macos" ;;
        "linux") platforms="linux" ;;
        "windows") platforms="windows" ;;
        *) echo "Geçersiz seçim! Varsayılan olarak 'ios,android,web,macos,linux,windows' platformları kullanılacak."; platforms="ios,android,web,macos,linux,windows" ;;
    esac

    # projeyi oluştur
    flutter create --org=com.firma.apps --platforms="$platforms" --template="$template" -e --project-name "$@"
}
