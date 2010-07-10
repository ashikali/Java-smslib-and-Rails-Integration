class WelcomeController < ApplicationController

  def send_sms
      get_content_group 
      get_number_group 

    if request.post?
      @sms_out_obj = SmsserverOutMessage.new #just for detecting errors 
      error_flag = nil
      rows = [ ]

      numbers = params[ :send_sms ][ :recipient ].split( /\D+/ )
      text = params[ :send_sms ][ :text ]


      if numbers.empty?
             @sms_out_obj.errors.add( :Recipient," : Recipient field has Invalid Numbers. Please check..."  )
             error_flag = 1
      end
      if text.empty? 
             @sms_out_obj.errors.add( :Content, " : Message content should not be empty. Please check..."      )
             error_flag = 1
      end

     if text.length > 156  
       @sms_out_obj.errors.add( :Content , " : Sorry, you have been restricted to send more than 156 message characters. your content length is #{text.length}" ) 
       error_flag = 1
     end

      unless error_flag
           numbers.shift if numbers[ 0 ] == ""   
            numbers.each{ |number|
             if number.length > 9 and number.length < 16 
              sms_out_tmp = SmsserverOutMessage.new
              sms_out_tmp.message_type = 'O'
              sms_out_tmp.recipient = number 
              sms_out_tmp.text =  text
              sms_out_tmp.priority = params[ :scheduled_on ]
              sms_out_tmp.flash_sms = params[ :sms_type ]
              rows.push( sms_out_tmp )
              #pass sms parameters here 
             else
               error_flag = 1
               @sms_out_obj.errors.add( :Recipient, " : #{number} seem to be a invalid number.  Please check"  )
               break
             end
           }
           unless error_flag
           rows.each{ |row| row.save! }
           session[:notice] = 'sms has been scheduled successfully..'
           end

      end

    end
  end

  def clear_sms_queue
      SmsserverOutMessage.delete_all
      begin 
      SmsserverOutMessage.find_by_sql( "alter table smsserver_out_messages  auto_increment=0;" )
      rescue NoMethodError
      end
      session[ :notice ] = "sms queue has been cleared successfully"
      redirect_to :action => :send_sms_queue 
  end

  def send_sms_queue
   @queued_sms =  SmsserverOutMessage.paginate( :all,:conditions => [ "status = ? or status = ?" , 'U','Q' ] , :order => "create_date",:page => params[ :page ] ,:per_page => 10 )
    session[ :notice ] = "Total No of SMS Queued is #{@queued_sms.total_entries}"
  end


  def send_sms_queue_destroy
   SmsserverOutMessage.find( params[ :id ] ).destroy
   session[ :info ] = "Queued Message has been successfully deleted" 
   redirect_to :action => :send_sms_queue 
  end

  def received_sms
      @received_sms = SmsserverInMessage.paginate( :all , :conditions => [ "process=?" , '0' ], :page => params[ :page ] , :order => 'receive_date desc' , :per_page => 10 ) 
      session[ :notice ] = "You have #{@received_sms.total_entries} new sms"
      @received_sms.each{ |message| message.process='1' ; message.save }
  end

  def missed_calls

     @calls =  SmsserverCall.paginate( :all , :conditions =>  [ "isread=?" , '0' ]  ,:page => params[ :page ] , :order => 'call_date desc' , :per_page => 10 )
     session[ :notice ] = "You have #{@calls.total_entries} missed calls" 
     @calls.each{ |call| call.isread='1' ;  call.save }

  end

  def get_message_group_value    
     row =  OutgoingSmsContentGroup.find_by_id( params[ "content_group_id" ] )
     render :inline =>   row  ?  row.sms_content  : ''
  end

  def get_number_group_value    
     row =  OutgoingSmsNumberGroup.find_by_id( params[ "number_group_id" ] )
    render :inline =>   row  ?  row.phone_numbers  : ''
  end

 private
  def get_records_per_id

    @sms_outqueue = SmsserverOutMessage.find( params[:id] )

  end
  def get_content_group
     
      @contents = OutgoingSmsContentGroup.find( :all ).map{ |row| [row.group_name,row.id] }
      @contents = ( @contents.empty? ) ?  nil : @contents.unshift( [ "--Select Message Template Here---","-1" ] )  

  end
  def get_number_group

    @numbers   = OutgoingSmsNumberGroup.find( :all ).map{|row| [row.group_name,row.id] }
    @numbers = ( @numbers.empty? ) ? nil : @numbers.unshift( [ "--Select Number Template Here--","-1" ] )  

  end


end
