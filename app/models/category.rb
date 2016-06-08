class Category < ActiveRecord::Base
  has_many :encounters
end
