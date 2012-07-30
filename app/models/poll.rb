class Poll < ActiveRecord::Base
  attr_accessible :admin_link, :name, :public_link
end
