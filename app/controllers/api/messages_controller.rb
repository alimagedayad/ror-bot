class Api::MessagesController < ApplicationController
    def getAllMessages
        user = Message.all
        render json: user
    end

    def getUserMessages
        puts params[:chat_id]
        messages = Message.where(chat_id: params[:chat_id])
        render json: messages
    end
end