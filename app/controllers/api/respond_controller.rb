class Api::RespondController < ApplicationController

    protect_from_forgery with: :null_session

    def post()
        message_request = ActiveSupport::JSON.decode(request.body.read)

        message = Message.create(
        users_id: 1,    
        chat_id: message_request['chat_id'],
        text: message_request['text'],
        admin: true)

        Telegram.bot.send_message(chat_id: message_request['chat_id'], text: message_request['text'])
    end
end