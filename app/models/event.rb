class Event < ActiveRecord::Base
  belongs_to :hosts, class_name: 'User', foreign_key:'host_id'  
end
