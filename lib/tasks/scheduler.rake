desc 'This task is called by the Heroku scheduler add-on'
task :scheduler do
  EmailSender.setup(ENV['DATABASE_URL'])
  EmailSender.send
end
