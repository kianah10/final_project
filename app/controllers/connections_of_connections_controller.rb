class ConnectionsOfConnectionsController < ApplicationController
  def index
    matching_connections_of_connections = ConnectionsOfConnection.all

    @list_of_connections_of_connections = matching_connections_of_connections.order({ :created_at => :desc })

    render({ :template => "connections_of_connections/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_connections_of_connections = ConnectionsOfConnection.where({ :id => the_id })

    @the_connections_of_connection = matching_connections_of_connections.at(0)

    render({ :template => "connections_of_connections/show.html.erb" })
  end

  def create
    the_connections_of_connection = ConnectionsOfConnection.new
    the_connections_of_connection.connection_id = params.fetch("query_connection_id")

    if the_connections_of_connection.valid?
      the_connections_of_connection.save
      redirect_to("/connections_of_connections", { :notice => "Connections of connection created successfully." })
    else
      redirect_to("/connections_of_connections", { :alert => the_connections_of_connection.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_connections_of_connection = ConnectionsOfConnection.where({ :id => the_id }).at(0)

    the_connections_of_connection.connection_id = params.fetch("query_connection_id")

    if the_connections_of_connection.valid?
      the_connections_of_connection.save
      redirect_to("/connections_of_connections/#{the_connections_of_connection.id}", { :notice => "Connections of connection updated successfully."} )
    else
      redirect_to("/connections_of_connections/#{the_connections_of_connection.id}", { :alert => the_connections_of_connection.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_connections_of_connection = ConnectionsOfConnection.where({ :id => the_id }).at(0)

    the_connections_of_connection.destroy

    redirect_to("/connections_of_connections", { :notice => "Connections of connection deleted successfully."} )
  end
end
