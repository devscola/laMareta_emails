
require './helpers/send_email'

module Birthday

  def greetings
    @vip_clients.each do |client|
      next unless birthday_is_today?(client)
      invitation_to(client)
    end
  end

  def birthday_is_today?(client)
    client_birthdate(client) == today_date
  end

  def today_date
    Time.mktime(0, Date.today.month, Date.today.day)
  end

  def client_birthdate(client)
    Time.mktime(0, client.birthday.month, client.birthday.day)
  end

end
