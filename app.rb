require 'sinatra'
require 'data_mapper'

require './helpers/birthday'

require './models/vip_clients.rb'
require './models/invitations.rb'

include Birthday

configure :development, :test do
  DataMapper.setup(:default, 'postgres://postgres@localhost/usersmareta')
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

def send_emails
  vip_clients = VipClients.all
  Birthday.greetings(vip_clients)
  halt 200
end
