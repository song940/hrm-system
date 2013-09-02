class Job < ActiveRecord::Base
	belongs_to :group

	def group
		Group.find(self[:group_id])
	end
end
