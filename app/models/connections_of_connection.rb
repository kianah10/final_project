# == Schema Information
#
# Table name: connections_of_connections
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  connection_id :integer
#
class ConnectionsOfConnection < ApplicationRecord
  belongs_to(:connection, { :required => true, :class_name => "Connection", :foreign_key => "connection_id" })
  has_many(:connections, { :class_name => "Connection", :foreign_key => "connection_of_connections_id", :dependent => :destroy })
end
