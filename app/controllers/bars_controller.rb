class BarsController < ApplicationController

  def index
    @bars = Bar.all
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
    @bar = Bar.find params[:id]
  end

end