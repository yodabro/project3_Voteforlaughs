class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :comedian
end
