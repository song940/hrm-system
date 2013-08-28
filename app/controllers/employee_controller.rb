class EmployeeController < ApplicationController
  def index
	@employee = Employee.all	
  end
  
  def new 
	@emp = Employee.new
  end

  def show

  end
end
