class HomeController < ApplicationController

    def initialize
        @app_id = ENV['INSTAGRAM_APP_ID']
        @auth_callback = ENV['AUTH_CALLBACK']
        @user_id = ENV['INSTAGRAM_USER_ID']
        @access_token = ENV['INSTAGRAM_ACCESS_TOKEN']
    end

    def index

        logger.debug 'getting user info: ' + user_info_url
        response = JSON.parse( HTTParty.get( user_info_url ).body )

        if response['error']
            logger.error 'index response failed: ' + response
            case response['error']['code']
                when 190 then redirect_to auth_url, allow_other_host: true
            end
        else
            @user_info = response
        end
    end

    # TODO: move to it's own controller
    def auth_callback
        
    end

    def auth_url
        'https://api.instagram.com/oauth/authorize' +
            '?client_id=' + @app_id +
            '&redirect_uri=' + @auth_callback +
            '&scope=user_profile,user_media,instagram_graph_user_profile,instagram_graph_user_media' +
            '&response_type=code'
    end

    def user_info_url
        'https://graph.facebook.com/' + @user_id +
            '?fields=biography,followers_count,follows_count,media_count,name,username' +
            '&access_token=' + @access_token
    end
end
