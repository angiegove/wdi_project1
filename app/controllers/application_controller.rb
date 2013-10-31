class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authentication #like a before do, before anything happens this happens

  private #must go at bottom of file it effects everything after it.
  #if you make this private wont effectif we name something else authenitication
    def authentication

      return unless (session[:user_id] || session[:company_id]) # Check for IDs to authenticate.

      @user_authenticated = User.find_by_id session[:user_id] unless session[:user_id].nil?
      @company_authenticated = Company.find_by_id session[:company_id] unless session[:company_id].nil?

      # If we didn't log anyone in, clear out the sessions so we don't try again.
      if @user_authenticated.nil? && @company_authenticated.nil?
        session[:user_id] = nil
        session[:company_id] = nil
      end
    end
end
