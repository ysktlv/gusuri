class TweetsController < ApplicationController
  before_action :set_twitter_client

  def create
    begin
      @tweet.update!("テスト3")
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
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
end
