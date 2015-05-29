desc 'This task is called by the Heroku scheduler add-on'
task :scheduler do
  send_emails
end
