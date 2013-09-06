module EmployeeHelper
	def emp_avatar_path(employee)
		avatar = "uploads/attachment/emp_#{employee.id}/avatar.png"
		avatar = "http://placehold.it/120&text=#{employee.name}" unless File.exist? Rails.root.join('public', avatar)
		"/#{avatar}"
	end
end
