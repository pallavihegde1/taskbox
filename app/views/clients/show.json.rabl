object @client
attributes :id, :name, :company
node("edit_url") {|client| edit_client_url(client)}

child :projects do
 attributes :id, :name, :status
end