require 'sinatra'
require 'data_mapper'

# HELPERS
require './helpers/check_birthday_users'

# MODELS
require './models/invitations.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'])

get '/' do
  send_invitations
end

def send_invitations
  @users = User.all
  if @users.any?
    CheckUsers.check_users_mareta(@users)
  end
end

