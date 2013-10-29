# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  image           :text
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :image, :password, :password_confirmation #even though not in db, need to be able use
  #because we have password digest in database
  has_many :wishlists


  validates :image, :presence => true
  validates :name, :presence => true, :length => { :minimum => 2}
end
