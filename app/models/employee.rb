class Employee < ActiveRecord::Base
	has_many :check , :dependent => :destroy
	has_many :education , :dependent => :destroy
	has_many :experience , :dependent => :destroy
	has_many :performance , :dependent => :destroy

	accepts_nested_attributes_for :education, :allow_destroy => true
	accepts_nested_attributes_for :experience, :allow_destroy => true

end
