class OutgoingSmsContentGroup < ActiveRecord::Base

 #def self.skip_time_zone_conversion_for_attributes
 #  [:created_at, :published_at]
 #end
 validates_presence_of   :group_name,:sms_content
 validates_uniqueness_of :group_name   
# Turin it off for the whole model
 def self.time_zone_aware_attributes
   false
 end
  
end
