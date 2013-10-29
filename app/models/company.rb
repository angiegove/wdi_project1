# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Company < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation
  has_many :bars

  validates :name, :presence => true, :length => { :minimum => 2}
end
