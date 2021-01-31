class ApplicationController < ActionController::Base

  after_action :store_location

  def store_location
    if (request.fullpath != "/owners/sign_in" &&
        request.fullpath != "/owners/sign_up" &&
        request.fullpath != "/owners/password" &&
        request.fullpath !~ Regexp.new("\\A/owners/password.*\\z") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end
end
