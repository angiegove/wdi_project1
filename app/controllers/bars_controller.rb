class BarsController < ApplicationController

  def index
    if @user_authenticated.is_admin?
      @bars = Bar.all
    else
      @bars = Bar.where(:approved => true)
    end
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new params[:bar]
    @bar.save
    redirect_to bars_path
  end

  def show
    # @company = Company.find params[:id]
    @bar = Bar.find params[:id]
  end

  def edit
    if @user_authenticated.is_admin?
       @bar = Bar.find params[:id]
      render :new
    else
      redirect_to bars_path
    end
  end

  def update
    if @user_authenticated.is_admin?
       @bar = Bar.find params[:id]
       @bar.update_attributes params[:bar]
      redirect_to bars_path
    end
  end

  def destroy
    if @user_authenticated.is_admin?
      bar = Bar.find params[:id]
      bar.destroy
      redirect_to bars_path
    end
  end

  #  private
  # def check_if_logged_in
  #   redirect_to(root_path) unless @user_authenticated.present?
  # end

  # def check_if_admin
  #   redirect_to(root_path) unless @user_authenticated.present? && @authenticated.is_admin?
  # end

end