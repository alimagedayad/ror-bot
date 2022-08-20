class Api::UsersController < ApplicationController
    def get
        user = User.all
        render json: user
    end
end