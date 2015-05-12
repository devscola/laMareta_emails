require 'pony'

module SendEmail

  def invitation_to(client)
    Pony.mail({:to => client.email,
     :from => ENV['MAIL_USERNAME'],
     :subject => 'Happy Birthday¡¡',
     :body => "Happy Birthday #{client.name}, you have a free meal with this code",
     :via => :smtp,
     :via_options => {
       :address              => ENV['MAIL_DOMAIN'],
       :port                 => ENV['MAIL_PORT'],
       :enable_starttls_auto => true,
       :user_name            => ENV['MAIL_USERNAME'],
       :password             => ENV['MAIL_PASSWORD'],
       :authentication       => :plain,
       :domain               => ENV['HELO_DOMAIN']
       }})
  end
end
