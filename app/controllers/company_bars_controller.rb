class CompanyBarsController < ApplicationController
  before_filter :check_if_logged_in

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new params[:bar]
    @bar.company_id = @company_authenticated.id
    @bar.save
    redirect_to @company_authenticated
  end

  def show
    @bar = Bar.find params[:id]
    @company = @bar.company
  end

  def edit
    @bar = Bar.find params[:id]
      render :new
      # redirect_to @company_authenticated
  end

  def update
    @bar = Bar.find params[:id]
    @bar.update_attributes params[:bar]
      redirect_to @company_authenticated
  end

  def destroy
      bar = Bar.find params[:id]
      bar.destroy
      redirect_to @company_authenticated
    end

  private
    def check_if_logged_in
      @company_authenticated.present?
    end


end