class Compilation < ActiveRecord::Base
  belongs_to :users
  belongs_to :contents
end
