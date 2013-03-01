class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_auth
    if session[:access_token] && session[:access_secret]
      @fitbit = Fitgem::Client.new(
        :consumer_key    => FITBIT_KEY,
        :consumer_secret => FITBIT_SECRET,
        :token           => session[:access_token],
        :secret          => session[:access_secret]
      )
      logger.error @fitbit.inspect
      @user = @fitbit.user_info['user']
      return true
    end
    redirect_to root_url
  end

end
