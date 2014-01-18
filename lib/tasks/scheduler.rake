desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  Alert.check_ask_reddit
  puts "done."
end
