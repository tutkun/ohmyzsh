if hash chsh >/dev/null 2>&1 && [ -f ~/.shell.pre-oh-my-zsh ]; then
  old_shell=$(cat ~/.shell.pre-oh-my-zsh)
  echo "Shelle ('$old_shell') geri dönülüyor:"
  if chsh -s "$old_shell"; then
    rm -f ~/.shell.pre-oh-my-zsh
  else
    echo "Varsayılan shell değiştirilemedi. chsh çalıştırarak manuel olarak değiştirin"
    echo "veya /etc/passwd dosyasını düzenleyin."
    exit
  fi
fi

read -r -p "Oh My Zsh'yi kaldırmak istediğinizden emin misiniz? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  echo "Kaldırma işlemi iptal edildi"
  exit
fi

echo "~/.oh-my-zsh kaldırılıyor"
if [ -d ~/.oh-my-zsh ]; then
  rm -rf ~/.oh-my-zsh
fi

if [ -e ~/.zshrc ]; then
  ZSHRC_SAVE=~/.zshrc.omz-uninstalled-$(date +%Y-%m-%d_%H-%M-%S)
  echo "~/.zshrc bulundu -- Şu şekilde adlandırılıyor: ${ZSHRC_SAVE}"
  mv ~/.zshrc "${ZSHRC_SAVE}"
fi

echo "Orijinal zsh config aranıyor..."
ZSHRC_ORIG=~/.zshrc.pre-oh-my-zsh
if [ -e "$ZSHRC_ORIG" ]; then
  echo "$ZSHRC_ORIG bulundu -- ~/.zshrc dosyasına adlandırılıyor..."
  mv "$ZSHRC_ORIG" ~/.zshrc
  echo "Orijinal zsh config geri yüklendi."
else
  echo "Orijinal zsh config bulunamadı."
fi

echo "Oh My Zsh'yi denediğiniz için teşekkür ederiz. Başarıyla kaldırıldı."
echo "Terminalinizi yeniden başlatmayı unutmayın!"
