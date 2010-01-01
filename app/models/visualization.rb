class Visualization < ActiveRecord::Base
  belongs_to :users
  belongs_to :panels
end
