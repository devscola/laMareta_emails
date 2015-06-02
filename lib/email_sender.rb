require 'data_mapper'

require_relative '../helpers/birthday'

require_relative '../models/vip_clients.rb'
require_relative '../models/invitations.rb'

include Birthday

class EmailSender
    def self.send
        vip_clients = VipClients.all
        Birthday.greetings(vip_clients)
    end

    def self.setup(url)
        DataMapper.setup(:default, url)
    end
end
