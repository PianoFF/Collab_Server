class ApplicationController < ActionController::API
      before_action :set_current_user

    def issue_token(payload) #called when a user SingsUp / LogsIn. See users_controller
        JWT.encode(payload, ENV['RAILS_SECRET'])
    end

    def decode_token(token)
      JWT.decode(token, ENV['RAILS_SECRET'])[0]
    end

    def get_token
        request.headers['Authorization'] || request.headers['Authorisation']
    end

    def set_current_user
        token = get_token

        if token
            decode_token = decode_token(token)
            #@current_user is then available for all the children controllers
            @current_user = User.find(decode_token['user_id'])
        else
            @current_user = nil 
        end
    end

    def logged_in?
        !!@current_user
    end
end