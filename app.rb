require 'sinatra'
require 'data_mapper'

require './helpers/birthday'

require './models/vip_clients.rb'
require './models/invitations.rb'

include Birthday

DataMapper.setup(:default, ENV['DATABASE_URL'])

get '/' do
  @vip_clients = VipClients.all
  send_invitations
end

def send_invitations
 return Birthday.greetings if @vip_clients.any?
end

