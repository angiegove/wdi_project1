class SessionController < ApplicationController
  def user_new
  end

  def company_new
  end
  # def new
  # end

  def user_create
    user = User.where(:email => params[:email]).first #.find only searches by if id,where lets you search by name
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Incorrect login: Try Again." #if want a notice to apear once
      redirect_to login_path
    end
  end

  def company_create
    company = Company.where(:email => params[:email]).first #.find only searches by if id,where lets you search by name
    if company.present? && company.authenticate(params[:password])
      session[:company_id] = company.id
      redirect_to root_path
    else
      flash[:notice] = "Incorrect login: Try Again." #if want a notice to apear once
      redirect_to company_login_path
    end
  end

  def user_destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def company_destroy
    session[:company_id] = nil
    redirect_to root_path
  end

end