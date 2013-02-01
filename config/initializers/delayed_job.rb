if Rails.env.development?
	system "RAILS_ENV=development #{Rails.root.join('script', 'delayed_job')} stop" 
	system "RAILS_ENV=development #{Rails.root.join('script', 'delayed_job')} start" 
end