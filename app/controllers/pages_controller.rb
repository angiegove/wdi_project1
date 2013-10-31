class PagesController < ApplicationController
  def home
    @wishlist = Wishlist.all.sample(3)
  end

end