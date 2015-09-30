class Follow < ActiveRecord::Base
  belongs_to :comedian
  belongs_to :user
end
