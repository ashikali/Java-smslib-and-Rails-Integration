class SmsserverOutMessage < ActiveRecord::Base
   def self.time_zone_aware_attributes
    false
   end
end
