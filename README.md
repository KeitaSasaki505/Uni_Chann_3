<img src="https://user-images.githubusercontent.com/69673353/103163919-bca8f780-4847-11eb-9bc0-cf64037d3b17.png" width="349">
<img width="max" alt="topイベント表示" src=https://user-images.githubusercontent.com/69673353/103164333-41e2db00-484d-11eb-93db-26dfa80f0942.png>

## 概要

ご近所様、小さな地域単位で使える「頼れる街の掲示板」です。
物理的に人と人の距離が離れる田舎町でも活発なワークショップを提案したり参加できるマッチング掲示板です。

## URL

https://www.unichann.com/

「ゲストログイン」よりユーザー登録をせずに機能を利用できます。
（※ゲストログインの場合のみユーザー情報の編集、退会が不可になっています）

## 制作の意図

都市部から離れた地方都市で暮らす家族からの要望です。
コロナ禍で外出自粛に伴い足を使った宣伝活動が制限される中、手芸やパン作りなどを趣味とし地方で開催されるワークショップへの出店情報を管理できるアプリを探していた経緯がありました。
解決すべくベータ版として制作しました。

また、地方では物理的に人と人の距離が離れており車が必須かつ天候によっては回覧板を渡すことさえ難がある状況です。
足を運ぶ必要のない簡単な用事はwebで済ませられるようアプリ化できないかという課題も合わせて解決を目指しました。

## 利用想定

【イベントオーナー】
* 小規模なワークショップやご近所様へのお知らせなどのイベントを「New」より作成する
* 変更がある場合は編集ページより可能
* 参加者の一覧を表示して確認できる。
* PCブラウザ版のみ参加者一覧を管理用にCSVファイルとしてダウンロード可能。

【イベント参加者】
* イベントへのコメント
* イベントへ「Join」（参加）できる。
* GoogleMapで開催場所の確認ができる

## 機能一覧

* ゲストログイン機能(閲覧用)
* ユーザー退会機能（ゲストログインのユーザーは不可）
* Map表示機能（GoogleMap API使用：開催場所住所から座標を自動で反映）
* CSVファイル出力機能(PC版ブラウザからのみ参加者一覧をファイル出力)
* レスポンシブデザイン対応（PC、タブレット、スマートフォン）
* イベント投稿編集機能
* コメント機能
* フォロー機能（いいねボタン）
* シェア機能（3媒体：Twitter、LINE、Facebook）
* 閲覧数表示機能
* ページネーション機能
* 検索機能
* イベントオーナー、参加意思表示機能（オーナーか参加決定済みイベントかを一覧内に表示させる）

<table>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/69673353/103164524-cd5d6b80-484f-11eb-8440-f9d84cdd2e33.png" height="300px" ></td>
    <td><img src="https://user-images.githubusercontent.com/69673353/103165454-8d03ea80-485b-11eb-8d9d-cb2aa2f56b32.png" height="300px" ##></td>
    <td><img src="https://user-images.githubusercontent.com/69673353/103164556-668c8200-4850-11eb-8160-b14313d03b6c.png" height="300px" ></td>
  </tr>
</table>

## 技術一覧
**フロントエンド**
* JavaScript,jQuery
* SCSS

**バックエンド**
* Ruby 2.6.5
* Rails 6.0.3.4

**開発環境/データベース**
* Docker/Dcoker-compose
* MySQL 5.6

**本番環境**
* AWS(EC2,S3,Route53,ELB,ACM)
* Nginx
* unicorn
* MySQL(MariaDB)
* Capistrano(デプロイ)

## インフラ構成図



## ER図

<img width="max" alt="ER図" src="https://user-images.githubusercontent.com/69673353/103166354-8c238680-4864-11eb-9dee-cadc32f39044.png">

## 自己紹介




