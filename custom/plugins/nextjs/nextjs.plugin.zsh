# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

# GitHub Projesi oluşturma yardımı
create-nextjs-app () {
    # CURR_DIR=$PWD
    DIR=$HOME/Developer/sites

    PROJECT_DIR=$DIR/$1

    if [ -d "$PROJECT_DIR" ]; then
        echo "\n\e[31mUYARI:\e[m" "\t\e[31m$1\e[m \e[32mdizini zaten mevcut. Bu işlem dizindeki verileri korumak için durduruldu.\e[m\n" "\t\e[34m$DIR/\e[31m$1\e[m\e[m\n"
    else
        # NextJS projesi çekiliyor
        # npx create-next-app $PROJECT_DIR --use-npm --example "https://github.com/vercel/next-learn/tree/master/basics/learn-starter"
        git clone https://github.com/tutkun/nextjs-webapp-template $PROJECT_DIR
        rm -rf $PROJECT_DIR/.git/

        # projenin kurulacağı dizine geç
        cd $PROJECT_DIR
        echo "$(PROJECT_DIR) dizinine geçiş yapıldı..."

        # git ile projeye dosyaları ekle
        git init
        git add .
        git commit -m "core(init): Mekik fırlatılıyor... 🚀"
        git branch -M master
        git remote add origin https://github.com/tutkun/$1.git
        git push -u origin master

        # bir önceki dizine geri dön
        echo "Bir önceki dizin olan \"\e[31m$(-)\e[m\" dizinine geçiş yapılıyor..."
        cd -
    fi;
}
