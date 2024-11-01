# Kullanıcıdan proje oluştururken template ve platform seçmesini isteyen bir fonksiyon
flutter-create-project(){
  # Parametreleri kontrol et
  if [[ $# -eq 1 ]]; then
    project_name="$1 $1"
  elif [[ $# -ge 2 ]]; then
    project_name=$("$@")
  else
    echo "\033[33mEn az bir parametre (proje_adi) girmelisiniz.\033[0m"
    return
  fi

  # Kullanıcıdan template seçimi alınır
  echo "\033[33mLütfen --template parametresi için bir seçim yapın:\033[0m"
  echo "\033[32m   [app]\033[0m - (varsayılan) Bir Flutter uygulaması oluşturun."
  echo "\033[32m   [module]\033[0m - Mevcut bir Android veya iOS uygulamasına Flutter modülü eklemek için bir proje oluşturun."
  echo "\033[32m   [package]\033[0m - Modüler Dart kodunu içeren paylaşılabilir bir Flutter projesi oluşturun."
  echo "\033[32m   [plugin]\033[0m - Dart kodunda ve platforma-özel method kanallarında bir API ile paylaşılabilir bir Flutter projesi oluşturun."
  echo "\033[32m   [plugin_ffi]\033[0m - Dart kodundaki bir API ve platforma-özel FFI uygulamalarıyla paylaşılabilir bir Flutter projesi oluşturun."
  echo "\033[32m   [skeleton]\033[0m - En iyi uygulamalara göre hazırlanmış bir ListView / DetailView Flutter uygulaması oluştur."
  echo -n "\033[33mSeçiminizi yapın (varsayılan: app): \033[0m"
  read template_choice

  # eğer kullanıcı boş bırakırsa varsayılan değer 'app' olarak ayarlanır
  case "$template_choice" in
    ""|"app") template="app" ;;
    "module") template="module" ;;
    "package") template="package" ;;
    "plugin") template="plugin" ;;
    "plugin_ffi") template="plugin_ffi" ;;
    "skeleton") template="skeleton" ;;
    *) echo "\033[31mGeçersiz seçim! Varsayılan olarak 'app' template'i kullanılacak.\033[0m"; template="app" ;;
  esac

  # Kullanıcıdan platformlar seçimi alınır
  echo "\033[33mLütfen --platforms parametresi için bir veya daha fazla seçim yapın:\033[0m"
  echo "\033[32m   [hepsi]\033[0m - tüm platformlar için (ios,android,web,macos,linux,windows) kurulumları yapar."
  echo "\033[32m   [ios]\033[0m - ios platformu için kurulumları yapar."
  echo "\033[32m   [android]\033[0m - android platformu için kurulumları yapar."
  echo "\033[32m   [web]\033[0m - web platformu için kurulumları yapar."
  echo "\033[32m   [macos]\033[0m - macos platformu için kurulumları yapar."
  echo "\033[32m   [linux]\033[0m - linux platformu için kurulumları yapar."
  echo "\033[32m   [windows]\033[0m - windows platformu için kurulumları yapar."
  echo -n "\033[33mSeçiminizi yapın (varsayılan: 'hepsi'): \033[0m"
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
    *) echo "\033[31mGeçersiz seçim! Varsayılan olarak 'ios,android,web,macos,linux,windows' platformları kullanılacak.\033[0m"; platforms="ios,android,web,macos,linux,windows" ;;
  esac

  # projeyi oluştur
  flutter create --org=com.tutkuns.apps --platforms="$platforms" --template="$template" -e --project-name "$project_name"
}
