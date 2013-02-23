class ResultsController < ApplicationController

  before_filter :require_auth

  def index
    # {"user"=>{"avatar"=>"http://cache.fitbit.com/451DD948-B205-B4D9-D8AC-DE4F26489839_profile_100_square.jpg", "city"=>"Las Vegas", "country"=>"US", "dateOfBirth"=>"1979-04-28", "displayName"=>"Pawel S.", "distanceUnit"=>"en_US", "encodedId"=>"225CGJ", "foodsLocale"=>"en_US", "fullName"=>"Pawel Szymczykowski", "gender"=>"MALE", "glucoseUnit"=>"en_US", "height"=>71.02362204724409, "heightUnit"=>"en_US", "locale"=>"en_US", "memberSince"=>"2011-08-30", "offsetFromUTCMillis"=>-28800000, "state"=>"NV", "strideLengthRunning"=>0, "strideLengthWalking"=>0, "timezone"=>"America/Los_Angeles", "waterUnit"=>"en_US", "weight"=>220.35, "weightUnit"=>"en_US"}}
    @activities = Activity.for_user( @fitbit.user_info['user']['encodedId'] )
  end

end
