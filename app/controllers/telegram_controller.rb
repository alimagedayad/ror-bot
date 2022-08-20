class TelegramController < Telegram::Bot::UpdatesController
    include Telegram::Bot::UpdatesController::MessageContext
    attr_accessor :user
    
    token = ENV['TOKEN']
    def user()
        @user ||= User.find_by(chat_id: from['id'])
    end

    # @user = User.find_by(user_id: from['id'])

    def name()
      return from['first_name'].to_s
    end
    
    def username
      if from['username'] == nil
        return from['first_name'].to_s + " " + from['last_name'].to_s
      else 
        return from['username'].to_s
      end
    end

    def start!(_word=nil, *_other_words)
      if user() == nil
        user = User.create(user_id: from['id'].to_i, username: username, chat_id: chat['id'].to_i)
        respond_with :message, text: "Hi there #{name}! You will be connected to one of our reps soon. Hang tight!"        
      else
        puts "#{user().username.to_s}"
        respond_with :message, text: "Hi # #{user().username.to_s}, #{name()}! You already established a chat with one of our reps wait for their response."
      end
    end
  
    def help!(*)
      respond_with :message, text: "Hi there! You have reached the help page of the bot."
    end

    
    def message(message)
      puts "chat: -------- " + message["photo"][0]["file_id"].to_s
      if message['photo'].to_s != nil
        file_id = message["photo"][0]["file_id"].to_s
        url = "https://api.telegram.org/bot#{token}/getFile?file_id=#{file_id}"
        response = RestClient.get(url)
        response = JSON.parse response.gsub('=>', ":")

        file_path = response["result"]["file_path"].to_s
        url_to_send = "https://api.telegram.org/file/bot#{token}/photos/#{file_path}"
        
        message = Message.create(
          chat_id: chat['id'],
          type: message['type'],
          media_link: url_to_send,
          users_id: user().id,
          admin: false)

      else
        message = Message.create(
          chat_id: chat['id'],
          text: message['text'],
          type: message['type'],
          users_id: user().id,
          admin: false)
      end
    end
  end