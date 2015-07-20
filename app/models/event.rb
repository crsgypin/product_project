class Event < ActiveRecord::Base
	has_many :results
	accepts_nested_attributes_for :results, allow_destroy: true

end
