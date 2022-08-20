class Api::RespondController < ApplicationController

    protect_from_forgery with: :null_session

    def post()
        puts request.body
        Telegram.bot.send_message(chat_id: 1547824270, text: params['message'])
    end
end