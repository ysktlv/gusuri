class TweetsController < ApplicationController
  before_action :set_twitter_client

  def create
    @reflection = Reflection.find(params[:reflection_id])
    @total_point = TotalPoint.find_by(reflection_id: @reflection.id)
    begin
      if @total_point.point >= 100
        @tweet.update!("#{@total_point.point}点でした！合格！\nhttps://gusuri.herokuapp.com/")
      else
        @tweet.update!("#{@total_point.point}点でした！残念！\nhttps://gusuri.herokuapp.com/")
      end
    rescue
      render plain: "同じ内容を連続でツイートできません！"
      return
    end
    render :index
  end

  private

  def set_twitter_client
    @tweet = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end
  end
end
