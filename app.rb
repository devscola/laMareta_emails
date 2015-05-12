require 'sinatra'
require 'data_mapper'

require './helpers/birthday'

require './models/vip_clients.rb'
require './models/invitations.rb'

include Birthday

DataMapper.setup(:default, ENV['DATABASE_URL'])

get '/' do
  send_invitations
end

def send_invitations
 @vip_clients = VipClients.all
 return Birthday.greetings(@vip_clients) if @vip_clients.any?
end

