class CreateConnectionsOfConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections_of_connections do |t|
      t.integer :connection_id

      t.timestamps
    end
  end
end
