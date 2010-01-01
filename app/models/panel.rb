class Panel < ActiveRecord::Base
  has_many :contents, :dependent => :destroy
  has_many :links, :dependent => :destroy
  
end
