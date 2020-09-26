namespace :notification do
  desc "sends SMS notification to  employees asking them to log overtime or not"
  task sms: :environment do
    User.all.each do |user|
      SmsTool.send_sms(number: 3, message:"test")
    end
  end

end
