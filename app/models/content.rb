class Content < ActiveRecord::Base
  belongs_to :panel
  has_many :compilations
  has_many :users, :through => :compilations
end
