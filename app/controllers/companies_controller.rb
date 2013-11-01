class CompaniesController < ApplicationController

  # before_filter :check_if_logged_in, :except => [:new, :create] #check if company is loged on except were ppl try to log on
  before_filter :check_if_admin, :only => [:index, :destroy]

  def index
    # @user = @user_authenticated.is_admin?
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    # raise_params.inspect
    @company = Company.new params[:company]
    if @company.save
      session[:company_id] = @company.id #log in companys when they create the account
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @company = Company.find params[:id]
  end

  def edit
    @company = Company.find params[:id] # @company_authenticated #instead of retyping it we just using the authenticated method to be used for edit
    unless @company.id == @company_authenticated.try(:id) || @user_authenticated.is_admin
      redirect_to root_path
    else
      render :new
    end
  end
  def update
    @company = @company_authenticated
    if @company.update_attributes params[:company]
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def check_if_logged_in
    redirect_to(root_path) unless @company_authenticated.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @user_authenticated.present? && @user_authenticated.is_admin?
  end

end