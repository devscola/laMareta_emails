class VipClients
  include DataMapper::Resource
  property :id, Serial
  property :name, Text
  property :birthday, Date
  property :email, Text
  has n, :invitations
end
