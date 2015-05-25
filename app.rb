require 'sinatra'
require 'data_mapper'

require './helpers/birthday'

require './models/vip_clients.rb'
require './models/invitations.rb'

include Birthday

DataMapper.setup(:default, ENV['DATABASE_URL'])

get '/' do
  vip_clients = VipClients.all
  Birthday.greetings(vip_clients)
  halt 200
end
