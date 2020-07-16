class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  #require 'sinatra' #なくても動く

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  # LINE Developers登録完了後に作成される環境変数の認証
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    #body = "フシギダネ"←ここは文字列じゃダメ JSONっぽい
    body = request.body.read

    #LINEから送られたものか検証。ここは消せないっぽい
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events = client.parse_events_from(body)
    #events = client.parse_events_from("フシギダネ\nH:45\nA:45\nB:45\nC:65\nD:65\nS:45\n\n弱点\nほのお、ひこう、こおり、エスパー\n特性\nしんりょく、ようりょくそ")
    #これもダメ

    #@pokemon = Pokemon.find(1)
    #events = @pokemon.name

    # evnets内のtypeを識別していく。
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        # 今回はメッセージに対応する処理を行うため、type: "text"の場合処理をする。
        # 例えば位置情報に対応する処理を行うためには、MessageType::Locationとなる。
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            #text: @pokemon.name
            #text: "フシギダネ\nH:45\nA:45\nB:45\nC:65\nD:65\nS:45\n\n弱点\nほのお、ひこう、こおり、エスパー\n特性\nしんりょく、ようりょくそ"
            text: event.message['text']
          }
          # 応答メッセージを送る
          client.reply_message(event['replyToken'], message)
        end
      end
    }

    head :ok
  end
end

