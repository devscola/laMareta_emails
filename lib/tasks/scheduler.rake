desc 'This task is called by the Heroku scheduler add-on'
task :scheduler do
  LaMaretaEmails.run!
end
