require 'sinatra/base'
require './lib/email_sender'

class LaMaretaEmails < Sinatra::Base

  configure :development, :test do
    EmailSender.setup('postgres://postgres@localhost/usersmareta')
  end

  configure :production do
    EmailSender.setup(ENV['DATABASE_URL'])
  end

  get '/' do
    EmailSender.send
    halt 200
  end
end
