class TelegramController < Telegram::Bot::UpdatesController
    include Telegram::Bot::UpdatesController::MessageContext
    attr_accessor :user
    
    def user()
        @user ||= User.find_by(chat_id: from['id'])
    end

    # @user = User.find_by(user_id: from['id'])

    def name()
      # if from['last_name'] != nil
      #   name = from['first_name'].to_s + " " + from['last_name'].to_s
      # else
      # name = from['first_name'].to_s
      # end
      return from['first_name'].to_s
    end
    
    def start!(_word=nil, *_other_words)
      # puts "from: " + from.to_s
      # puts "chat: " + chat.to_s
      # user = User.find_by(user_id: from['id'])
      if user() == nil
        user = User.create(user_id: from['id'].to_i, username: from['username'].to_s, chat_id: chat['id'].to_i)
        respond_with :message, text: "Hi there #{name}! You will be connected to one of our reps soon. Hang tight!"        
      else
        respond_with :message, text: "#{user().chat_id.to_s}"
        respond_with :message, text: "Hi # #{user().chat_id.to_s}, #{name()}! You already established a chat with one of our reps wait for their response."
      end
    end
  
    def help!(*)
      respond_with :message, text: "Hi there! You have reached the help page of the bot."
    end

    # def message(message)
    #   respond_with :message, text: message['text']
    # end

    def message(message)
      puts "chat: " + chat.to_s
      message = Message.create(chat_id: chat['id'], text: message['text'], type: message['type'], users_id: user().id)
      respond_with :message, text: "You have recieved your message"
    end

  end