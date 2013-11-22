class Admin::Setting < ActiveRecord::Base
	def self.set(name,key,val)
		@setting = Admin::Setting.where(:name => name,:key => key).first
		@setting ||= Admin::Setting.new(:name => name,:key => key)
		@setting.update_attributes(:value => val)
	end

	def self.get(name,key)
		Admin::Setting.where(:name => name, :key => key).first[:value]
	end
end
