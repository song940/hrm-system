class Job < ActiveRecord::Base
	belongs_to :group

	def group
	# => 
	result = nil
		begin

			result = Group.find(self[:group_id])

		rescue => ex
			result = nil
			logger.info ex.message.to_s
		end
		result
	end
end
