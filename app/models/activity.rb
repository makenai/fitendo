class Activity < ActiveRecord::Base

  attr_accessible :response, :user_id, :for_date, :cumulative_steps
  belongs_to :user

  def self.for_user( fitbit, user, date=Date.today )
    if activity = self.where( :user_id => user['encodedId'], :for_date => date ).first
      return JSON.parse( activity.response )
    else
      activities = fitbit.activities_on_date( date )
      Activity.create(
        :user_id => user['encodedId'],
        :response => activities.to_json,
        :for_date => date,
        :cumulative_steps => self.cumulative_steps( user['encodedId'], date ) + activities['summary']['steps'].to_i
      )
      return activities
    end
  end

  def self.cumulative_steps( user_id, date )
    if last_activity = self.where('user_id = ? AND for_date < ?', user_id, date ).order('for_date DESC').first
      last_activity.cumulative_steps
    else
      0
    end
  end

end