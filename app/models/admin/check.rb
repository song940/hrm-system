class Admin::Check < ActiveRecord::Base
  validates :date,  presence: true ,  uniqueness: true
end
