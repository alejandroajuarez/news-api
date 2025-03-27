class GithubController < ApplicationController

  def authorize
    p Rails.application.credentials.github_client_id
    p Rails.application.credentials.github_client_secret
    p params[:code]
    response = HTTP.headers("Accept" => "application/json").post("https://github.com/login/oauth/access_token",
    form: {
      client_id: Rails.application.credentials.github_client_id,
      client_secret: Rails.application.credentials.github_client_secret,
      code: params[:code]
  })
    render json: response.parse
  end
end
