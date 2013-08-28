class Employee < ActiveRecord::Base
	has_many :job
	has_many :express
	has_many :education
end
