require 'sinatra/base'
require 'data_mapper'

require './helpers/birthday'

require './models/vip_clients.rb'
require './models/invitations.rb'

include Birthday

class LaMaretaEmails < Sinatra::Base

  configure :development, :test do
    DataMapper.setup(:default, 'postgres://postgres@localhost/usersmareta')
  end

  configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
  end

  get '/' do
    vip_clients = VipClients.all
    Birthday.greetings(vip_clients)
    halt 200
  end
end
