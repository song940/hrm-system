class Group < ActiveRecord::Base
	has_many :job

	@level = 0

	def self.level=(level)
		@level = level
	end

	def self.level
		@level
	end
end
