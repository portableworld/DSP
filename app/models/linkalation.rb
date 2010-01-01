class Linkalation < ActiveRecord::Base
  belongs_to :users
  belongs_to :links
end
