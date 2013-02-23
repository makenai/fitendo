if Rails.env.production?
  FITBIT_KEY    = 'a77db83c38904ee3b645f66da94c672b'
  FITBIT_SECRET = '81fb20ee86474388b9fd0d89029f857c'
else
  FITBIT_KEY    = 'e197c4fc4e8f49159716bcaa3af4756d'
  FITBIT_SECRET = '3147cf9465d1466b85ef209e81ea8ca4'
end

$fitbit = Fitgem::Client.new(
  :consumer_key => FITBIT_KEY,
  :consumer_secret => FITBIT_SECRET
)