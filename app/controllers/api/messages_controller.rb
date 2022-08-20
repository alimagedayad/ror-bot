class Api::MessagesController < ApplicationController
    def get
        user = Message.all
        render json: user
    end
end