# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:connections, { :class_name => "Connection", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })
end
