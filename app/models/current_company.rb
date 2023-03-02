# == Schema Information
#
# Table name: current_companies
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CurrentCompany < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:connections, { :class_name => "Connection", :foreign_key => "company_id", :dependent => :destroy })
end
