class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authentication #like a before do, before anything happens this happens

  private #must go at bottom of file it effects everything after it.
  #if you make this private wont effectif we name something else authenitication
    def authentication
      @user_authenticated = User.find session[:user_id] unless session[:user_id].nil?
      @company_authenticated = Company.find session[:company_id] unless session[:company_id].nil?
    end
end
