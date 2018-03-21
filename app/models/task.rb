class Task < ApplicationRecord
  validates_length_of :description, minimum: 5, maximum: 50, allow_blank: false
end
