class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :photo_id
      t.integer :company_id
      t.integer :connection_of_connections_id

      t.timestamps
    end
  end
end
