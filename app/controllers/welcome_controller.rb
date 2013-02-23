class WelcomeController < ApplicationController

  def index
  end


  def auth
    request_token = $fitbit.request_token
    session[:token]  = request_token.token
    session[:secret] = request_token.secret
    redirect_to "http://www.fitbit.com/oauth/authorize?oauth_token=#{token}"
  end

  def callback
    access_token = client.authorize(token, secret, { :oauth_verifier => verifier })
    render :text => 'Hello Nurse'
  end


end
