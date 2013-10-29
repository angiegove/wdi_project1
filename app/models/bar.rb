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
  attr_accessible :name, :image, :description, :email, :address, :city, :events, :opening_hours
  has_and_belongs_to_many :wishlists
  belongs_to :company
end
