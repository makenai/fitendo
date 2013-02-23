class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_auth
    if session[:access_token] && session[:access_secret]
      @fitbit = Fitgem::Client.new(
        :consumer_key    => 'e197c4fc4e8f49159716bcaa3af4756d',
        :consumer_secret => '3147cf9465d1466b85ef209e81ea8ca4',
        :token           => session[:access_token],
        :secret          => session[:access_secret]
      )
      return true
    end
    redirect_to root_url
  end

end
