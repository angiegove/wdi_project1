class WishlistsController < ApplicationController

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new params[:wishlist]
    @wishlist.user = @user_authenticated
    @wishlist.save
    redirect_to user_path(@user_authenticated)
  end

  def show
    @wishlist = Wishlist.find params[:id]
    @bars = @wishlist.bars
  end

   def edit
    @wishlist = Wishlist.find params[:id]
    render :new
  end

  def update
    @wishlist = Wishlist.find params[:id]
    @wishlist.update_attributes params[:wishlist]
      redirect_to wishlist_path
  end

end