class OutgoingSmsNumberGroup < ActiveRecord::Base
   
      validates_presence_of   :group_name,:phone_numbers
      validates_uniqueness_of :group_name  

      def validate
        numbers = self.phone_numbers.split(/[^0-9]+/)
        before_filter_len = numbers.delete_if{ |x| x.eql?( '' ) }.length
        after_filter_len = numbers.delete_if{| x | x.length < 10 or x.length > 15 }.length
        if before_filter_len < 1 or before_filter_len != after_filter_len 
          errors.add(:phone_numbers,"Field Some Numbers are not look like a mobile number, Please check..." )
        else
          self.phone_numbers = numbers.join( ',' )
        end 
      end

      def self.time_zone_aware_attributes
        false
      end

end
