class Twin < ApplicationRecord
  validates_uniqueness_of :input
  validates_presence_of :input
end
