# == Schema Information
#
# Table name: bars
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  description   :text
#  image         :text
#  address       :text
#  city          :text
#  events        :text
#  opening_hours :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  approved      :boolean          default(FALSE)
#

# == Schema Information
#
# Table name: bars
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  description   :text
#  image         :text
#  address       :text
#  city          :text
#  events        :text
#  opening_hours :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Bar < ActiveRecord::Base
  # mount_uploader :image, ImageUploader

  attr_accessible :name, :image, :description, :email, :address, :city, :events, :opening_hours, :company_id, :approved
  has_and_belongs_to_many :wishlists
  belongs_to :company
end
