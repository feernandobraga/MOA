class ApplicationController < ActionController::Base

  before_action :authenticate_member!
  # this is so user needs to authenticate before using the app!

end
