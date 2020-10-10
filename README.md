# **PokemonBot**
既存で存在せず実用性を伴ったアプリをテーマに作成しました。<br>


## 概要
LINEBOTを利用したポケモンデータ検索<br>
ひらがな/カタカナ入力で対象ポケモンの下記データが返信されます！<br>
制限時間を設けられたオンライン対戦で極めて重要なデータを、他サービスの何よりも早く返答します！<br>
※第8世代未対応。随時対応予定<br>
・タイプ<br>
・個体値<br>
・特性<br><br>

また同じような局地的利用目的であれば、<br>
データベースの差し替えで様々なケースに対応できます。<br>
<img src="https://i.gyazo.com/88f32310781cbad9763ba2c7625ab554.png" width="35%">
<br><br>

## 制作物
下記のQRコードから友達登録でご使用いただけます<br>
<img src="https://i.gyazo.com/6b86a7e0ab032aa66fd6dd99c97ab358.png" width="50%">
<br><br>

## 使用技術(開発環境)
LINE BOT  MESSAGE API<br>
ngrok<br>
Heroku<br>
postgresql<br>
<br><br>


## 工夫したポイント
検索先のデータベースを作成する必要がありましたが、<br>
最低限の情報とはいえ約1,000体分のデータを作成するとなると効率が悪いので<br>
拾えたデータを使いエクセルでシートを作成、<br>
postgresqlのシートからデータを読み込める機能を利用し<br>
エクセル → postgresql → seeds.rb で読み込める形に変換、<br>
デプロイ後、本番環境のデータベースに反映させるという手段に結果至りました。<br><br><br>

## 課題や今後実装したい機能
Herokuデプロイの関係で初回起動に10秒程必要としてしまう。<br>
対戦において多少駆け引きの考えられるレベルを想定しているので、<br>
完全初心者に向けた情報検索機能を追加する。<br><br>
・AWS<br>
・Docker<br>
・CircleCI<br><br>

・他情報データ追加<br>
  "とくせい"の詳細情報のリンクを返答メッセージに追加<br><br><br>

## 制作物語
もはや国民的キャラクターとなるポケモン。<br>
1996年にゲームボーイで「収集、育成、対戦、交換」の要素を加えたRPGとして発売され、<br>
当時終息を迎えようとしていた携帯ゲーム機市場を大きく変化させた爆発的ヒット作品です。<br><br>

販売当初から対戦において各地で大会が行われるなど人気がありましたが、2010年にオンライン対戦が始まるとさらに広がりを見せ<br>
対戦をメインとしたテレビ番組が放送されたり、YouTubeで毎週のように実況やLiveの動画が流れるなど<br>
小学生・芸能人・YouTuber・海外勢など様々な人々が入り乱れ火花を散らしあっている巨大コンテンツとなっています。<br><br>


かくいう私は、年末にYouTubeでたまたま流れてきた対戦動画を拝見し、<br>
懐かしさのあまり小学生当時のポケモンに熱中したあの頃の気持ちを思い出し、<br>
そのままゲオでニンテンドースイッチ本体ごと購入してしまった、ただのにわかポケモントレーナーです。<br>
（上記の説明は軽くネットで調べたものです）<br><br>

さて本体ごと買っちゃったわけだし、さっさとストーリーをクリアして対戦だ！と意気込んでいたら、<br>
もちもの？？とくせい？？こんなわざ知らないよ。。。<br><br>

同じポケモンでも育て方次第で全く違うポケモンに様変わり！<br>
時代とともに変化してきたポケットモンスターは20年前のポケモン知識で通用するはずもなく、<br>
満を持して挑んだオンライン対戦では怒涛の20連敗と、ノリで始めたにわかトレーナーに現実の厳しさを突きつけてくる結果となりました。<br><br>

そもそもストーリー攻略中とは違い対戦相手がいる関係上、コマンド選択に制限時間が設けられており<br>
時間中に最善手の決断を求められるオンライン対戦では知識量の差が大きくモノをいい、<br>
にわかトレーナーには中々ハードルの高いことを思い知りました。（それでも調べれば強い育成自体はできるので、他ゲームと比べればそこまで厳しくはない）<br><br>


じゃあ知識のない自分が最前線のトレーナーたちと戦う為の手段はなにか。。<br>
そう、その対戦における知識量というアドバンテージを埋める為の解決策として生まれたのがこの `”PokemonBot”` です。<br><br><br>


前提として覚えておかなければいけない知識はありますが、<br>
制限時間内に最低限の情報を得るためにはLINEBOTのレスポンスの早さはまさに最適。<br>
実際の実況者も相手ポケモンの情報確認にブラウザ検索を使用しているなど、<br>
確実にそれよりも早いレスポンスで情報取得できる"PokemonBot"は、私の想定以上に利用価値のあるものができてしまったと思っています。<br><br><br>
