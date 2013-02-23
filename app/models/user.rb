class User < ActiveRecord::Base
  attr_accessible :start_date, :user_id
  has_many :activities
end
