# == Schema Information
#
# Table name: wishlists
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image       :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Wishlist < ActiveRecord::Base
   mount_uploader :image, ImageUploader

  attr_accessible :title, :image, :description, :user_id, :bar_ids, :remote_image_url
  belongs_to :user
  has_and_belongs_to_many :bars
end
