class WelcomeController < ApplicationController

  def index
    if session[:access_token]
      redirect_to results_url
    end
  end

  def auth
    request_token = $fitbit.request_token
    token = session[:request_token] = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to "http://www.fitbit.com/oauth/authorize?oauth_token=#{token}"
  end

  def callback
    verifier = params[:oauth_verifier]
    access_token = $fitbit.authorize( session[:request_token], session[:request_secret], { :oauth_verifier => verifier })
    session[:access_token]  = access_token.token
    session[:access_secret] = access_token.secret
    redirect_to results_url
  end

  def logout
    reset_session
    redirect_to root_url
  end

end
