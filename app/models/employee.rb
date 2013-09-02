class Employee < ActiveRecord::Base

	has_many :job , :dependent => :destroy
	has_many :check , :dependent => :destroy
	has_many :education , :dependent => :destroy
	has_many :experience , :dependent => :destroy
	has_many :performance , :dependent => :destroy

	accepts_nested_attributes_for :job, :allow_destroy => true
	accepts_nested_attributes_for :education, :allow_destroy => true
	accepts_nested_attributes_for :experience, :allow_destroy => true


	def birthday
		tmpDate = self[:passport][6,8]
		year = tmpDate[0,4].to_i
		month = tmpDate[4,2].to_i
		day = tmpDate[6,2].to_i
		Date.new(year, month, day)
	end

	def province
		self[:passport][0,2]
	end

	def city
		self[:passport][2,2]
	end

	def area
		self[:passport][4,2]
	end

	def gender
		!((self[:passport][16,1].to_i % 2 ) == 0)
	end

end
