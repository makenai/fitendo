class ResultsController < ApplicationController

  before_filter :require_auth

  def index
    @date = params[:date] ? Date.parse( params[:date] ) : Date.today
    if params[:refresh]
      Activity.update_activity!( @fitbit, @user, @date )
      redirect_to "/results?date=#{@date.strftime('%Y-%m-%d')}"
    end
    logger.error "Cat"
    logger.error @user
    @previous_day = Activity.previous_day( @user['encodedId'], @date )
    @next_day = Activity.next_day( @user['encodedId'], @date )
    @activities = Activity.for_user( @fitbit, @user, @date )
    @starting_steps = Activity.cumulative_steps( @user['encodedId'], @date )
    @ending_steps = @activities['summary']['steps'].to_i + @starting_steps
  end

end
