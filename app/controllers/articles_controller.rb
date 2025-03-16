class ArticlesController < ApplicationController

  def index
    response = HTTP.get("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=#{Rails.application.credentials[:news_api_key]}")

    render json: response.parse["articles"]
  end
end
