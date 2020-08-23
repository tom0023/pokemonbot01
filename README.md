# アプリ名
PokemonBot

# 概要
LINEBOTを利用したポケモンデータ検索<br>
オンライン対戦において必要最低限の情報を迅速なレスポンスでお届け！<br>
ひらがな/カタカナ入力で対象ポケモンの下記データが返信されます！<br><br>
・タイプ<br>
・個体値<br>
・特性<br><br>

また同じような局地的利用目的であれば、<br>
データベースの差し替えで様々なケースに対応できる可能性を秘めております！<br><br>


！ [QRコード](2020-08-21 16.20.29.png)
<br>

# 制作物語
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



# 工夫したポイント
検索先のデータベースを作成する必要がありましたが、<br>
最低限の情報とはいえ約1,000体分のデータを作成するとなると黙々と作る気が起きなかったので<br>
拾えたデータを使いエクセルでシートを作成、<br>
postgresqlのシートからデータを読み込める機能を利用し<br>
エクセル → postgresql → seeds.rb で読み込める形に変換、<br>
デプロイ後、本番環境のデータベースに反映させるという手段に結果至りました。<br><br><br>


# 使用技術(開発環境)
LINE BOT<br>
MESSAGE API<br>
ngrok<br>
heroku<br>


# 課題や今後実装したい機能
・見やすい表示<br>
・ボタン入力でさらに詳しい情報の取得<br>
強いて言えば上記の二点ですが、必要最低限の機能は備えているので<br>
レスポンスに影響のない範囲で手を加えていこうと思います。
