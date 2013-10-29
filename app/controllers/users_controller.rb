class UsersController < ApplicationController

  before_filter :check_if_logged_in, :except => [:new, :create] #check if user is loged on except were ppl try to log on
  before_filter :check_if_admin, :only => [:index, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    #@wishlists = Wishlist.where :user_id => @user.id
    @wishlists = @user.wishlists
  end

  def new
    @user = User.new
  end

  def create
    # raise_params.inspect
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id #log in users when they create the account
      redirect_to root_path
    else
      render :new
    end
  end

  def create_admin
  end

  def edit
    @user = @user_authenticated #instead of retyping it we just using the authenticated method to be used for edit
    render :new
  end

  def update
    @user = @user_authenticated
    if @user.update_attributes params[:user]
      redirect_to root_path
    else
      render :new
    end
  end

  # def wishlist
  #   @wishlist = Wishlist.all
  # end

  private
  def check_if_logged_in
    redirect_to(root_path) unless @user_authenticated.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @user_authenticated.present? && @authenticated.is_admin?
  end

end