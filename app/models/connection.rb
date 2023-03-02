# == Schema Information
#
# Table name: connections
#
#  id                           :integer          not null, primary key
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  comment_id                   :integer
#  company_id                   :integer
#  connection_of_connections_id :integer
#  photo_id                     :integer
#  user_id                      :integer
#
class Connection < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "connection_id", :dependent => :destroy })
  has_many(:connections_of_connections, { :class_name => "ConnectionsOfConnection", :foreign_key => "connection_id", :dependent => :destroy })
  belongs_to(:company, { :required => true, :class_name => "CurrentCompany", :foreign_key => "company_id" })
  belongs_to(:connection_of_connections, { :required => true, :class_name => "ConnectionsOfConnection", :foreign_key => "connection_of_connections_id" })
  has_many(:connection, { :through => :connection_of_connections, :source => :connection })
  has_many(:connections, { :through => :connections_of_connections, :source => :connections })
end
