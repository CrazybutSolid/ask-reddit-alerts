class Alert < ActiveRecord::Base
	belongs_to :user
	validates_length_of :keyword, minimum: 4
	validates_presence_of :user_id

	def self.check_ask_reddit
		response = HTTParty.get('http://www.reddit.com/r/askreddit/new.json?sort=new', :headers => {"User-Agent" => APPLICATION_NAME})
		response['data']['children'].each do |thread|
			Alert.each do |alert|
				if thread['data']['title'].include?(alert.keyword)
					url = thread['data']['url']
					title = thread['data']['title']
					UserMailer.notify_new_thread(alert,url,title).deliver
				end
			end
		end
	end
end
