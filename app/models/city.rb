class City < ActiveRecord::Base
  has_many :comedians, :through => :votes, dependent: :destroy
  has_many :users, :through => :votes, dependent: :destroy
  has_many :votes, dependent: :destroy
end
