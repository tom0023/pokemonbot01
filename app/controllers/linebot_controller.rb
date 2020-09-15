class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
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
    body = request.body.read
    #LINEから送られたものか検証。
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events = client.parse_events_from(body)

    # evnets内のtypeを識別していく。
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        # 今回はメッセージに対応する処理を行うため、type: "text"の場合処理をする。
        # 例えば位置情報に対応する処理を行うためには、MessageType::Locationとなる。
        when Line::Bot::Event::MessageType::Text
          @pokemon = Pokemon.where("name LIKE(?) or rename LIKE(?)", "%#{event.message['text']}%", "%#{event.message['text']}%")
          #ヒットしたかしなかったかで分岐
          if @pokemon != []
            #ヒット数が一つか複数かで分岐
            if @pokemon.length == 1
              @pokemon = @pokemon[0]
              message = {
                type: 'text',
                text: "#{@pokemon.name}\nタイプ：#{@pokemon.type}\nH：#{@pokemon.h}\nA：#{@pokemon.a}\nB：#{@pokemon.b}\nC：#{@pokemon.c}\nD：#{@pokemon.d}\nS：#{@pokemon.s}\n特性\n#{@pokemon.ability}"
              }
              client.reply_message(event['replyToken'], message)
            elsif @pokemon.length > 1
              messages = []
              @pokemon.each do |pokemon|
                messages << {type: 'text',text: "#{pokemon.name}\nタイプ：#{pokemon.type}\nH：#{pokemon.h}\nA：#{pokemon.a}\nB：#{pokemon.b}\nC：#{pokemon.c}\nD：#{pokemon.d}\nS：#{pokemon.s}\n特性\n#{pokemon.ability}"}
              end
              client.reply_message(event['replyToken'], messages)
            end
          else
            message = {
              type: 'text',
              text: "そんなポケモンいないよ！"
            }
            client.reply_message(event['replyToken'], message)
          end
        end
      end
    }
    head :ok
  end
end

