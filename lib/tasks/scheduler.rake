desc 'This task is called by the Heroku scheduler add-on'
task :scheduler_job => :environment do
  send_emails
end