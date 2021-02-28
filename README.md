# Gusuri

無駄な夜ふかしの悪循環から抜け出すためのアプリ。
GUSURIで1日の満足度を高め、快適な睡眠を！

## 制作意図

夜ふかしをしてしまうことが多く、解決策を考えていたところ、1日の満足度と睡眠の質や入眠の早さが関連しているという記事を見つけた。
簡単な目標を設定し、少しでも達成感を味わうことが夜ふかし防止につながるのではないかと考えた。

## 使い方

目標とそのポイントを設定

![ポイント作成](https://user-images.githubusercontent.com/68413373/109418390-7caeee00-7a0b-11eb-98c1-8884f677fee4.gif)

![ポイント編集保存](https://user-images.githubusercontent.com/68413373/109418838-b4b73080-7a0d-11eb-8b28-77efd7b1c65b.gif)

寝る前に記録

![日記登録](https://user-images.githubusercontent.com/68413373/109419191-97836180-7a0f-11eb-9a2c-71e5d7fc3523.gif)

結果を100点満点で判定

![ツイート](https://user-images.githubusercontent.com/68413373/109419297-12e51300-7a10-11eb-8247-0cd94ac7dfe3.gif)

ツイート

<img width="609" alt="スクリーンショット 2021-02-28 15 35 56" src="https://user-images.githubusercontent.com/68413373/109419337-445dde80-7a10-11eb-9687-9afaa0f2f87a.png">

## URL

**https://gusuri.herokuapp.com/**

## テスト用アカウント

### Basic認証

ユーザー名 admin

パスワード 2222

### ログイン

ユーザー名 gusuri3

パスワード gusugusugusu3


## 工夫したポイント

TwitterAPIの使用 アプリから直接ツイートを可能に

トークンの送信方法

同じ内容の連続したツイートを禁止（アカウント凍結を防ぐため）

見やすいUI

## ER図

![gusuri ER図](https://user-images.githubusercontent.com/68413373/106223102-268c3680-6224-11eb-9c7d-2fee037c3f41.png)

## 今後実装したい機能

ユーザー同士の交流ができる場の作成

レスポンシブデザイン対応
