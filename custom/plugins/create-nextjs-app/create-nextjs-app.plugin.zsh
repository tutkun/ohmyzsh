# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

# GitHub Projesi oluşturma yardımı
create-nextjs-app(){
    # CURR_DIR=$PWD
    DIR="${HOME}/Developer/sites"
    GITHUB="https://github.com/tutkun/${1}"

    PROJECT_DIR="${DIR}/${1}"

    if [ -d "$PROJECT_DIR" ]; then
        echo "\n\e[31mUYARI:\e[m" "\t\e[31m$1\e[m \e[32mdizini zaten mevcut. Bu işlem dizindeki verileri korumak için durduruldu.\e[m\n" "\t\e[34m$DIR/\e[31m$1\e[m\e[m\n"
    else
        # NextJS projesi çekiliyor
        # npx create-next-app $PROJECT_DIR --use-npm --example "https://github.com/vercel/next-learn/tree/master/basics/learn-starter"
        git clone --depth=1 https://github.com/tutkun/nextjs-webapp-template $PROJECT_DIR
        # rm -rf $PROJECT_DIR/.git/

        # projenin kurulacağı dizine geç
        cd $PROJECT_DIR
        echo "${PROJECT_DIR} dizinine geçiş yapıldı..."

        # git ile projeye dosyaları ekle
        # git init
        git add .
        git commit -m "Uzay yolculuğu başladı... 🚀"
        # git branch -M master
        # git remote add origin "${GITHUB}.git"
        git remote set-url origin "${GITHUB}"
        git push -u origin master

        echo "${GITHUB} Reposu oluşturuldu 🚀"

        # bir önceki dizine geri dön
        echo "Bir önceki dizin olan \"$(-)\" dizine geçiş yapılıyor..."
        cd -
    fi;
}
