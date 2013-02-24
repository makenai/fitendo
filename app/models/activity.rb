class Activity < ActiveRecord::Base

  attr_accessible :response, :user_id, :for_date, :cumulative_steps
  belongs_to :user

  def self.for_user( fitbit, user, date=Date.today )
    if activity = self.where( 'user_id = ? AND for_date = ? AND updated_at > ?', user['encodedId'], 
      date, Time.now - 30.minutes ).first
      return JSON.parse( activity.response )
    else
      self.update_activity!( fitbit, user, date )
    end
  rescue
    self.update_activity!( fitbit, user, date )
  end

  def self.update_activity!( fitbit, user, date )
    activities = fitbit.activities_on_date( date )
    activity = Activity.find_or_initialize_by_user_id_and_for_date(
      :user_id => user['encodedId'],
      :for_date => date
    )
    activity.update_attributes(
      :response => activities.to_json,
      :cumulative_steps => self.cumulative_steps( user['encodedId'], date ) + activities['summary']['steps'].to_i
    )
    return activities    
  end

  def self.cumulative_steps( user_id, date )
    if last_activity = self.where('user_id = ? AND for_date < ?', user_id, date ).order('for_date DESC').first
      last_activity.cumulative_steps
    else
      0
    end
  end

  def self.previous_day( user_id, date )
    if last = self.where('user_id = ? AND for_date < ?', user_id, date ).order('for_date DESC').first
      last.for_date
    end
  end

  def self.next_day( user_id, date )
    if last = self.where('user_id = ? AND for_date > ?', user_id, date ).order('for_date ASC').first
      last.for_date
    end
  end

end