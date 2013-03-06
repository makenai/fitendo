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
      @user = @fitbit.user_info['user']
      if @user
        User.find_or_create_by_user_id( @user['encodedId'] ).update_attributes(
          access_token: session[:access_token],
          access_secret: session[:access_secret],
          display_name: @user['displayName'],
          last_access: Time.now
        )
        return true
      end
    end
    redirect_to root_url
  end

end
