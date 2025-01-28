class TweetsController < ApplicationController

    def create
        token = cookies.signed[:twitter_session_token]
        session = Session.find_by(token: token)

        if session
            user = session.user
            @tweet = user.tweets.new(tweet_params)

            if@tweet.save
                render 'tweets/create'
            else
                render json: { success: false }
            end
        else
            render json: { success: false }
        end
    end

    def destroy
        token = cookies.signed[:twitter_session_token]
        session = Session.find_by(token: token)
        @tweet = Tweet.find_by(id: params[:id])

        if session
            if @tweet and @tweet.destroy
                render json: { success: true }
            else
                render json: { success: false }
            end
        else    
            render json: { success: false}
        end
    end

    def index
        @tweets = Tweet.all
        render 'tweets/index'
    end

    def index_by_user
        @tweets = User.find_by(username: params[:username]).tweets.all
        if @tweets
            render 'tweets/index'
        else
            render json: {tweets: [] }
        end
    end

    def tweet_params
        params.require(:tweet).permit(:message)
    end
end
