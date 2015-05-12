require 'sinatra'
require 'data_mapper'

require './helpers/birthday'

DataMapper.setup(:default, ENV['DATABASE_URL'])

get '/' do
  @vip_clients = VipClients.all
  send_invitations
end

def send_invitations
 return greetings if @vip_clients.any?
end

