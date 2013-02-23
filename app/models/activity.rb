class Activity < ActiveRecord::Base
  attr_accessible :response, :user_id


  def self.for_user( user_id, date=Date.today )
    # @fitbit.activities_on_date('today')
    self.where( user_id: user_id, :created_at => date.yesterday..date )
  end

end
