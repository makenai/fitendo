class ResultsController < ApplicationController

  before_filter :require_auth

  def index
    @activities = @fitbit.activities_on_date('today')
  end

end
