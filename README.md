About SMSlib :

      SMSLib is a Java library which allows you to send/receive SMS messages via a compatible GSM modem or 
      GSM phone . To know more about java smslib please visit www.smslib.org . 

About Ruby on Rails :

      Ruby on Rails is a open source web developing kit , it  Works well on both Linux and windows OS . 

About SMSlib SMSServer :

      SMSServer is a small application that you can use for sending and receiving SMS messages without writing your own code.

      The new SMSServer is fully configurable and can be easily extended. It is based on two new concepts:

    		* SMSServer uses one or more Gateways to send and receive messages.
    		* SMSServer uses one or more Interfaces for some sort of persistent storage, to which it saves received messages 
                  or send messages from.

      Please visit http://smslib.org/doc/smsserver/  to know about full funtionality of SMSServer . 

About SMSServerGui-2.0 :

      It is a Ruby on Rails based web front for SMSServer . It acts as interface between users and SMSserver . Users 
      can load , unload sms . Also they can monitor SMSServer from this .

OS Compatibility:

      Normally all the java and Ruby on Rails prorams work well on both windows and linux operating system . This frontend has 
      been throughly tested on both windows and linux .

      For windows I choosed XP ;  For linux I choosed Ubuntu and Debian distributions 

Java jdk Installation:
---------------------
        
	i) Create the smslib_source directory in /usr/src . 
	
	ii) Download  jdk-6u20-linux-i586.bin from http://java.sun.com/javase/downloads/widget/jdk6.jsp 
	
	iv) Run the jdk-6u20-linux-i586.bin file in your console by typing 

       sts:/usr/src#>./jdk-6u20-linux-i586.bin        
	
	Note:
	Depending upon your OS , use appropriate JDK package name . 
	My OS Details are,
	sts:~# uname -a
	Linux sts 2.6.26-2-686 #1 SMP Wed Aug 19 06:06:52 UTC 2009 i686 GNU/Linux


v) Before installing jdk , there may be a chance of Java is avaliable in our Linux operating system . 
   It may not be up to date . So we have to set the path variable for current jdk bin directory . 

    Add below line into your .bashrc file . 

    export PATH="/usr/src/jdk1.6.0_20/bin:$PATH"

vi) Run the .bashrc file by typing in your console #>./.bashrc 

vii) Check the java version by typing 
   
       sts:~# echo $PATH
       /usr/src/jdk1.6.0_20/bin:/usr/src/jdk1.6.0_20/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
       sts:~# java -version
       java version "1.6.0_20"
       Java(TM) SE Runtime Environment (build 1.6.0_20-b02)
       Java HotSpot(TM) Client VM (build 16.3-b01, mixed mode)

      Right now we installed current version of  jdk . 

     Note : 
         By the time I used jdk 1.6.0_20 version . Please replace with current jdk for best results .

Mysql Database Installation:
----------------------------

    sts:~#aptitude install mysql-server
     
    loging as mysql administrator . And create the smslib named database and user with password 'smslib' .

    sts:~#mysql -u root -p

    mysql> create database smslib ;
    Query OK, 0 rows affected (0.01 sec)
    mysql> grant all on smslib.* to smslib@localhost identified by 'smslib' ;
    Query OK, 0 rows affected (0.02 sec)


SMSlib SMSServer Installation :
------------------------------
      
    i) Download the current smslib from http://smslib.org/download/files/smslib-v3.4.6.zip 
       and unzip it in /usr/src/smslib_sources/smslib directory . 

      we have to install followings dependencies to make smslib work  .
     
   ii) Java Communications Library Installation :
           
        This library is used to interact with serial devices such as modem,mobile ..etc . Along with rxtx jar; 
	we have to install the two .so files well . It is better for us to install it from synaptic,apt-get 
	or aptitute without go for downloading rxtx library and compiling it .
       	  
       	  sts:/usr/src# aptitude install librxtx-java

       	  it would install .so files in /usr/lib directory .
       	  
       	   sts:/usr/lib# ls -lrt librxtx*
       	   -rw-r--r-- 1 root root   875 2008-07-21 22:44 librxtxSerial.la
       	   -rw-r--r-- 1 root root 49072 2008-07-21 22:44 librxtxSerial-2.1-7.so
       	   -rw-r--r-- 1 root root   869 2008-07-21 22:44 librxtxRS485.la
       	   -rw-r--r-- 1 root root 17932 2008-07-21 22:44 librxtxRS485-2.1-7.so
       	   -rw-r--r-- 1 root root   857 2008-07-21 22:44 librxtxRaw.la
       	   -rw-r--r-- 1 root root 17248 2008-07-21 22:44 librxtxRaw-2.1-7.so
       	   -rw-r--r-- 1 root root   887 2008-07-21 22:44 librxtxParallel.la
       	   -rw-r--r-- 1 root root 10012 2008-07-21 22:44 librxtxParallel-2.1-7.so
       	   -rw-r--r-- 1 root root   857 2008-07-21 22:44 librxtxI2C.la
       	   -rw-r--r-- 1 root root 17164 2008-07-21 22:44 librxtxI2C-2.1-7.so
       	   lrwxrwxrwx 1 root root    22 2010-05-15 17:44 librxtxSerial.so -> librxtxSerial-2.1-7.so
       	   lrwxrwxrwx 1 root root    21 2010-05-15 17:44 librxtxRS485.so -> librxtxRS485-2.1-7.so
       	   lrwxrwxrwx 1 root root    19 2010-05-15 17:44 librxtxRaw.so -> librxtxRaw-2.1-7.so
       	   lrwxrwxrwx 1 root root    24 2010-05-15 17:44 librxtxParallel.so -> librxtxParallel-2.1-7.so
       	   lrwxrwxrwx 1 root root    19 2010-05-15 17:44 librxtxI2C.so -> librxtxI2C-2.1-7.so

         java native c libraries are installed succfully in /usr/lib directort . Next thing is we have to 
	 findout RXTXcomm.jar. By default it would be installed  in  /usr/share/java directory .

          -->  Now copy RXTXcomm.jar file into /usr/src/jdk1.6.0_20/jre/lib/ext .
       	
        That is it . We have successfully installed RXTX java communication library on Debian or Ubuntu OS .


       Note :
              if you are unable to findout /usr/share/java or/and /usr/lib/jvm . Then you may want to 
	      install default java package from OS repository .

              we need to install default java; then only we can get precompiled librxtx-java library . 
	      Just we are cheating here . After installing this default-java be ensure that you are not 
	      set PATH variable value to this java binary . 

              After installation please check java version well . Because this java version not compatible with current smslib .

	      Why we are cheating over here is that installing rxtx is not easy .


   iii) Apache ant installation :
               
             --> Download latest Apache Ant from http://ant.apache.org/bindownload.cgi 
             --> Decompress it and save it in smslib_source directory .
             --> Now append bin location  into PATH variable .  Edit .bashrc file again and relplace export path variable with below .

                 export PATH="/usr/src/jdk1.6.0_20/bin:/usr/src/smslib_source/apache-ant-1.8.1/bin:$PATH"

             --> check ant command version after running 
                 sts:/usr/src/smslib_source/apache-ant-1.8.1/bin# ~/.bashrc
                 sts:/usr/src/smslib_source/rxtx-2.1-7-bins-r2/Linux/i686-unknown-linux-gnu# ant -version

       	  Apache Ant version 1.8.1 compiled on April 30 2010

   iv) Apache log4j library installation :
                 
             --> Download lattest appache log4j from http://logging.apache.org/log4j/1.2/download.html and save it in smslib_source
                 directory .
             --> Uncompress it dpending upon your source extension .
             --> copy log4j jar file into /usr/src/jdk<version>/jre/lib/ext directory .
                    
       	  sts:/usr/src/smslib_source/apache-log4j-1.2.16# cp log4j-1.2.16.jar /usr/src/jdk1.6.0_20/jre/lib/ext/

   v) JSMPP library installation : 
       		
             --> Download lattest jsmpp library from http://code.google.com/p/jsmpp/downloads/list and save it in smslib_source 
       	         directory .
             --> Uncompress it depending upon your source extension . 
             --> Copy jsmpp<version>.jar file into /usr/src/jdk<version>/jre/lib/ext directory .
       	
       	sts:/usr/src/smslib_source/jsmpp-2.1.0# cp *.jar /usr/src/jdk1.6.0_20/jre/lib/ext/

  vi) Apache Jakarta Commons - NET library Installation :  

             --> Download lattest NET library from http://commons.apache.org/downloads/download_net.cgi and save it in smslib_source 
                 directory .
             --> Uncompress it depending upon your source extension . 
             --> Copy all jar files into /usr/src/jdk<version>/jre/lib/ext directory .
       	                
            	sts:/usr/src/smslib_source/commons-net-2.0# cp *.jar ../../jdk1.6.0_20/jre/lib/ext/

  vii) Java mysql Connector Installation :

            --> if you are using mysql then we have to download the java mysql from http://dev.mysql.com/downloads/connector/j/ 
                and save it in smslib_source .
            --> Uncompress it depending upon your source extension .
            --> Copy  mysql-connector-java<version>.jar into /usr/src/jdk<version>/jre/lib/ext directory .
             
       	sts:/usr/src/smslib_source/mysql-connector-java-5.1.12# cp mysql-connector-java-5.1.12-bin.jar  ../../jdk1.6.0_20/jre/lib/ext
           
Compile and Run SMSserver :
--------------------------

                   	 
     i) As of now , we have installed all dependencies for SMSServer . Let us play with SMSServer right now .

	        sts:/usr/src/smslib_source/jsmpp-2.1.0# cd ../smslib
		sts:/usr/src/smslib_source/smslib# ant

		Buildfile: build.xml
		
		usage:
		     [echo] 
		     [echo] 		SMSLib v3
		     [echo] 		(c) 2002-2010, Thanasis Delenikas
		     [echo] 		Visit http://smslib.org for latest information.
		     [echo] 		SMSLib is distributed under the Apache v2.0 license.
		     [echo] 	
		     [echo] 		Accepted targets:
		     [echo] 			clean: Clean everything.
		     [echo] 			doc: Generate JavaDoc pages for the core library.
		     [echo] 			compile-smslib: Compiles the core library.
		     [echo] 			build-smslib: Builds the core library.
		     [echo] 			compile-smsserver: Compiles the SMSServer application.
		     [echo] 			build-smsserver: Builds the SMSServer application (bundled with SMSLib core files in one jar).
		     [echo] 			build-smsserver-standalone: Builds the SMSServer application as a standalone jar (without SMSLib core files).
		     [echo] 		
		
		BUILD SUCCESSFUL
		Total time: 0 seconds
                sts:/usr/src/smslib_source/smslib# ant clean

		Buildfile: /usr/src/smslib_source/smslib/build.xml
		
		clean:
		   [delete] Deleting directory /usr/src/smslib_source/smslib/dist

		sts:/usr/src/smslib_source/smslib# ant build-smsserver
		Buildfile: /usr/src/smslib_source/smslib/build.xml
		
		compile.smsserver:
		
		pre-build.smsserver:
		    [mkdir] Created dir: /usr/src/smslib_source/smslib/dist/lib
		     [copy] Copying 1 file to /usr/src/smslib_source/smslib/dist/lib
		
		build.smsserver:
		      [jar] Building jar: /usr/src/smslib_source/smslib/dist/lib/smsserver-3.4.6.jar
		
		build-smsserver:
		
		BUILD SUCCESSFUL
		Total time: 0 seconds

		sts:/usr/src/smslib_source/smslib# cd dist/classes/

		Now copy the sample SMSServer.conf into this directory . Please have look on http://www.smslib.org/doc/smsserver/

		sts:/usr/src/smslib_source/smslib/dist/classes# cp ../../src/java/org/smslib/smsserver/SMSServer.conf .

		sts:/usr/src/smslib_source/smslib/dist/classes# java org.smslib.smsserver.SMSServer
		SMSLib: A Java API library for sending and receiving SMS via a GSM modem or other supported gateways.
		This software is distributed under the terms of the Apache v2.0 License.
		Web Site: http://smslib.org
		
		SMSLib API version: 3.4.6
		SMSServer version: 3.4.6
		log4j:WARN No appenders could be found for logger (smslib).
		log4j:WARN Please initialize the log4j system properly.
		log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.

	        Note: 
                    While running if the log4j say any warnings same as above then we have to copy log4j.properties file . 
                    Because it needs some log configurations where the smsserver runs . So we do that so . Run 
		    following command . 

	       sts:/usr/src/smslib_source/smslib/dist/classes# cp ../../misc/Log4j\ Sample\ Configuration/log4j.properties  .

       ii) Copy sample configuration :

                 sts:/var/www/SMSSserverGui# cp config/SMSServer.conf /usr/src/smslib_source/smslib/dist/classes/

	Note :

	Walkthrough SMSServer.conf file and replace device path with appropriate values .			      


SMSServer and Rails Integration: 
--------------------------------

	 Both Rails and SMSServer sync with Database SMSServer's tables . Rails acts as web interface between user 
    	 and those tables( SMSServer ) . Please have look on http://www.smslib.org/doc/smsserver/interfaces/database/ 
       	 for more details .

	    Installing mysql and rails on Debian or ubuntu : 

	       --> Ruby On Rails Installation :

	          i) Ruby Installation :

			Install the following packages either using aptitude or apt-get or synaptic 

			i) ruby1.8
		       ii) ruby1.8-dev
		      iii) libopenssl-ruby
		       iv) libmysql-ruby1.8

	               Note :
			 Install either ruby1.8,ruby1.8-dev or ruby1.9,ruby1.9-dev don't install both . 
                       	 After installing above packages . Create soft link for ruby1.X as ruby in /usr/bin directory .

		  ii) gem Installation :

                        i ) Download current version of rubygems from http://rubyforge.org/frs/?group_id=126 and save it in /usr/src . 
			    I choosed 1.3.5
			ii) Decompress it and go into the directory .

	  	 		sts:/usr/src/rubygems/rubygems-1.3.5# ruby setup.rb 

		       iii) Now gem1.X has been installed successfully . Create soft link for gem1.X as gem  in /usr/bin directort .

		 iii) Rails Installation 
                       
			  sts:~# gem install rails --include-dependencies
			
		 iv)  SMSServer Gui Installation :

			  Go into the Java-smslib-and-Rails-Integration Directory now . And copy SMSSserverGui.tgz into /var/www directory .
			   
			  sts:/var/www/SMSSserverGui# tar -xvzf SMSSserverGui.tgz
			  sts:/var/www/SMSSserverGui# rake gems:install
			  sts:/var/www/SMSSserverGui# gem list

			    *** LOCAL GEMS ***
			    
			    actionmailer (2.3.5)
			    actionpack (2.3.5)
			    activerecord (2.3.5)
			    activeresource (2.3.5)
			    activesupport (2.3.5)
			    calendar_date_select (1.16.1)
			    log4r (1.1.7)
			    mislav-will_paginate (2.3.11)
			    rack (1.0.1)
			    rails (2.3.5)
			    rake (0.8.7)
			    rubigen (1.5.4)
        

      
Contradictions and patches to integrate SMSlib with Ruby on Rails  : 
     
	  Here Ruby on Rails act as front end application for SMSServer's tables. In contrast to say , the SMSServer aggressively 
	  watches the tables of SMSServer; To know more about SMSServer tables. Please visit  http://smslib.org/doc/smsserver/interfaces/database/.
	  Here we are going to feed the SMSServer via Ruby on Rails application .

	  To integrate SMSServer Tables with Rails application , the tables should be in under some rules and regulations .

	  What are those Rules and Regulations how to Balance this
	  --------------------------------------------------------
	
  	      i) Table name should be in plural form .  

               we can achive this by configuring SMSServer.conf file . For example in SMSServer.conf file .
	       # Here is an example of a MySQL database interface.

		interface.0=db1, Database
		db1.type=mysql
		db1.url=jdbc:mysql://localhost:3306/smslib?autoReconnect=true
		db1.driver=com.mysql.jdbc.Driver
		db1.username=smslib
		db1.password=jsmslib
		db1.tables.sms_in=smsserver_in_messages
		db1.tables.sms_out=smsserver_out_messages
		db1.tables.calls=smsserver_calls
		db1.batch_size=50
		db1.retries=0
		db1.update_outbound_on_statusreport=no

	  	It it is easy for us to change the tables names in SMSServer.conf . Yet one more modifications we need;  read further .

	    	  copy sample configuraion file and put it in SMServer directory . It has configuration settings for mysql database .

		  sts:/var/www/SMSSserverGui# cp config/SMSServer.conf /usr/src/smslib_source/smslib/dist/classes/

         	 Note :
                     Have look on this SMSServer.conf file and configure your modem here  . By default it 
		     may have /dev/ttyACM0 as device path .

	     
   	      ii) Table Column names should not be same as its object predefined methods .


	          some of the column specified in http://smslib.org/doc/smsserver/interfaces/database/ are creating contradiction with  rails 
		  application . For example type in smsserver_in table . And type,error in smsserver_out tables . After go walkthrough Database.java file in smslib
                  source I changed some of colums names . Now both rails and SMSServer working well with this .

		   I used smslib 3.4.6 which is the current source right now . Replace Database.java using below command .
	
			sts:/var/www/SMSSserverGui# cp config/Database.java /usr/src/smslib_source/smslib/src/java/org/smslib/smsserver/interfaces/

		   Note : 

			After applying this patch . Follow "Compile and Run SMSserver" steps .


		Now the time had come to run both SMSServerGui and SMSserver as well .
	 

Create SMSServer and SMSServerGui Tables :
----------------------------------------

	SMSServerGui Database Configurations :

	        --> Go to /var/www/SMSServerGui/db
	        --> configure database in database.yml 
		--> sts:/var/www/SMSSserverGui/db# mysql -D smslib -u smslib  -p
			Enter password: 
			Reading table information for completion of table and column names
			You can turn off this feature to get a quicker startup with -A
			
			Welcome to the MySQL monitor.  Commands end with ; or \g.
			Your MySQL connection id is 197
			Server version: 5.0.51a-24+lenny3 (Debian)
			
			Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
			
			mysql> 
			mysql> 
			mysql> \. smslib.sql
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.01 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.00 sec)
			
			Query OK, 0 rows affected (0.01 sec)
			
			Query OK, 1 row affected (0.00 sec)
			
			mysql> show tables ;
			+-----------------------------+
			| Tables_in_smslib            |
			+-----------------------------+
			| outgoing_sms_content_groups | 
			| outgoing_sms_number_groups  | 
			| schema_migrations           | 
			| smsserver_calls             | 
			| smsserver_in_messages       | 
			| smsserver_out_messages      | 
			| users                       | 
			+-----------------------------+
			7 rows in set (0.00 sec)
			
			mysql> 
			
			
	   Now all the tables have been created in smslib database . Cross check the same .
	
	
Running SMSserver :
		
		sts:/usr/src/smslib_source/smslib/dist/classes# java  -Dsmslib.serial.polling=true -Dgnu.io.rxtx.SerialPorts=/dev/ttyACM0 org/smslib/smsserver/SMSServer

		SMSLib: A Java API library for sending and receiving SMS via a GSM modem or other supported gateways.
		This software is distributed under the terms of the Apache v2.0 License.
		Web Site: http://smslib.org
		
		SMSLib API version: 3.4.6
		SMSServer version: 3.4.6
		0      2010-05-17 17:54:45,483 [main] INFO  org.smslib.helper.Logger  - SMSLib: A Java API 
		library for sending and receiving SMS via a GSM modem or other supported gateways. This software 
		is distributed under the terms of the Apache v2.0 License.
		Web Site: http://smslib.org
		2      2010-05-17 17:54:45,485 [main] INFO  org.smslib.helper.Logger  - Version: 3.4.6
		2      2010-05-17 17:54:45,485 [main] INFO  org.smslib.helper.Logger  - JRE Version: 1.6.0_20
		4      2010-05-17 17:54:45,487 [main] INFO  org.smslib.helper.Logger  - JRE Impl Version: 16.3-b01
		4      2010-05-17 17:54:45,487 [main] INFO  org.smslib.helper.Logger  - O/S: Linux / i386 / 2.6.26-2-686
		12     2010-05-17 17:54:45,495 [main] INFO  org.smslib.helper.Logger  - SMSServer: set balancer to: RoundRobinLoadBalancer
		30     2010-05-17 17:54:45,513 [main] INFO  org.smslib.helper.Logger  - SMSServer: added gateway modem1 / Default Serial Modem Gateway.
		34     2010-05-17 17:54:45,517 [main] INFO  org.smslib.helper.Logger  - SMSServer: added interface db1 / Default database interface. / INOUTBOUND
		249    2010-05-17 17:54:45,732 [main] INFO  org.smslib.helper.Logger  - SMSServer: interface: org.smslib.smsserver.interfaces.Database started.
		250    2010-05-17 17:54:45,733 [Thread-5] INFO  org.smslib.helper.Logger  - GTW: modem1: Starting gateway, using Generic AT Handler.
		250    2010-05-17 17:54:45,733 [Thread-5] INFO  org.smslib.helper.Logger  - GTW: modem1: Using polled serial port mode.
		250    2010-05-17 17:54:45,733 [Thread-5] INFO  org.smslib.helper.Logger  - GTW: modem1: Opening: /dev/ttyACM0 @57600
		Experimental:  JNI_OnLoad called.
		Stable Library
		=========================================
		Native lib Version = RXTX-2.1-7
		Java lib Version   = RXTX-2.1-7
		8575   2010-05-17 17:54:54,058 [Thread-5] INFO  org.smslib.helper.Logger  - GTW: modem1: GSM: Registered to home network.
		8981   2010-05-17 17:54:54,464 [Thread-5] INFO  org.smslib.helper.Logger  - GTW: modem1: MEM: Storage Locations Found: SM ME SM_P ME_P MT
		9172   2010-05-17 17:54:54,655 [Thread-5] INFO  org.smslib.helper.Logger  - CNMI: No best match, returning: 1
		9574   2010-05-17 17:54:55,057 [Thread-5] INFO  org.smslib.helper.Logger  - GTW: modem1: Gateway started.
		10281  2010-05-17 17:54:55,764 [SMSServer - OutboundPollingThread] INFO org.smslib.helper.Logger  - SMSServer: sending asynchronously... [0]
		20288  2010-05-17 17:55:05,771 [SMSServer - OutboundPollingThread] INFO org.smslib.helper.Logger  - SMSServer: sending asynchronously... [0]
	

            Note :
		
                In the java command I had passed following arguments . 

		-Dsmslib.serial.polling=true :

			It is must for smslib to detect rxtx library . For more information have 
			look on http://smslib.org/doc/smslib/parameters/

		-Dgnu.io.rxtx.SerialPorts=/dev/ttyACM0 

		       It is must for SMSlib to detect our device although we mentioned it in SMSServer.conf file . 
		       By default it may detects ttyS0 devices . 

		 If you have any problem to run SMSServer then visit www.smslib.org for more documenation than this .
                      

Running SMSServerGui :
	          sts:/var/www/SMSSserverGui# ruby script/server 
	        	=> Booting WEBrick
			=> Rails 2.3.5 application starting on http://0.0.0.0:3000
			=> Call with -d to detach
			=> Ctrl-C to shutdown server
			[2010-05-17 18:00:15] INFO  WEBrick 1.3.1
			[2010-05-17 18:00:15] INFO  ruby 1.8.7 (2008-08-11) [i486-linux]
			[2010-05-17 18:00:20] INFO  WEBrick::HTTPServer#start: pid=9153 port=3000


	         Now go to firefox and IE type the URL mentioned above . Give username and password as smslib 


For windows OS:
        	 To installing smslib and SMSServerGui in windows almost same as linux . You can find more information 
		 to install smslib on windows from  http://smslib.org/doc/installation/ .

From Author:

	  
	Enjoy with SMSlib and SMSserverGui!

	Any feedbacks contact me at ashikali.m@gmail.com


  	Cheers ,
  	Ashik
