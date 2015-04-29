require 'sinatra'
require 'data_mapper'
require 'pony'

# HELPERS
require './helpers/code'
require './helpers/check_birthday_users'

# MODELS
require './models/users.rb'
require './models/invitations.rb'

include Code
include CheckUsers

DataMapper.setup(:default, ENV['DATABASE_URL'])



get '/' do
  # Call method that send the emails
  send_emails
end

def send_emails
  @users = User.all
  if @users.any?
    CheckUsers.check_users_mareta(@users)
  end
end

