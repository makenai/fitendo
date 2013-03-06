class User < ActiveRecord::Base
  attr_accessible :user_id, :display_name, :access_token, :access_secret, :last_access
  has_many :activities

  def client
    Fitgem::Client.new(
        :consumer_key    => FITBIT_KEY,
        :consumer_secret => FITBIT_SECRET,
        :token           => self.access_token,
        :secret          => self.access_secret
      )
  end

end
