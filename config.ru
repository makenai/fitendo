# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

p ENV['RACK_ENV']

use Rack::CanonicalHost do
  'fitendo.net' unless ENV['RACK_ENV'] == "development"
end
run Fitendo::Application
