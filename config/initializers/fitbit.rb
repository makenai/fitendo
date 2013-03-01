if Rails.env.production?
  FITBIT_KEY    = '1904f109a86c458eaa263148e2955fc0'
  FITBIT_SECRET = '108af6d02bc74cba8b9465a3e2e912d1'
else
  FITBIT_KEY    = 'e197c4fc4e8f49159716bcaa3af4756d'
  FITBIT_SECRET = '3147cf9465d1466b85ef209e81ea8ca4'
end

$fitbit = Fitgem::Client.new(
  :consumer_key => FITBIT_KEY,
  :consumer_secret => FITBIT_SECRET
)