# Gusuri

夜ふかしの悪循環から抜け出すためのアプリです。
GUSURIで1日の満足度を高めましょう！

# URL

**https://gusuri.herokuapp.com/**

# テスト用アカウント

## Basic認証

ユーザー名 admin
パスワード 2222

## ログイン用

ユーザー名 @gusuri3
パスワード gusugusugusu3

# ER図

![gusuri ER図](https://user-images.githubusercontent.com/68413373/106223102-268c3680-6224-11eb-9c7d-2fee037c3f41.png)


# 構築方法

git clone https://github.com/ysktlv/gusuri.git

cd gusuri

bundle install

rails db:create

rails db:migrate

rails s

http://localhost:3000