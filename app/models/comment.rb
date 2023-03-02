# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  body          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  commenter_id  :integer
#  connection_id :integer
#
class Comment < ApplicationRecord
  belongs_to(:commenter, { :required => true, :class_name => "User", :foreign_key => "commenter_id" })
  belongs_to(:connection, { :required => true, :class_name => "Connection", :foreign_key => "connection_id" })
end
