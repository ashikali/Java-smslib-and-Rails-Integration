DROP TABLE IF EXISTS smsserver_calls ;
CREATE TABLE `smsserver_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `call_date` datetime NOT NULL,
  `gateway_id` char(64) NOT NULL,
  `caller_id` text NOT NULL,
  `isread` boolean default 0 ,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS smsserver_in_messages;
CREATE TABLE `smsserver_in_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `process` int(11) NOT NULL,
  `originator` varchar(16) NOT NULL,
  `message_type` varchar(1) NOT NULL,
  `encoding` char(1) NOT NULL,
  `message_date` datetime NOT NULL,
  `receive_date` datetime NOT NULL,
  `text` varchar(1000) NOT NULL,
  `original_ref_no` varchar(64) DEFAULT NULL,
  `original_receive_date` datetime DEFAULT NULL,
  `gateway_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 /*!40100 DEFAULT CHARSET=utf8*/;


DROP TABLE IF EXISTS `smsserver_out_messages` ;
CREATE TABLE `smsserver_out_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_type` varchar(1) NOT NULL DEFAULT 'O',
  `recipient` varchar(16) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `wap_url` varchar(100) DEFAULT NULL,
  `wap_expiry_date` datetime DEFAULT NULL,
  `wap_signal` varchar(1) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `originator` varchar(16) NOT NULL DEFAULT ' ',
  `encoding` varchar(1) NOT NULL DEFAULT '7',
  `status_report` int(1) NOT NULL DEFAULT '0',
  `flash_sms` int(1) NOT NULL DEFAULT '0',
  `src_port` int(6) NOT NULL DEFAULT '-1',
  `dst_port` int(6) NOT NULL DEFAULT '-1',
  `sent_date` datetime DEFAULT NULL,
  `ref_no` varchar(64) DEFAULT NULL,
  `priority` int(5) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT 'U',
  `no_of_errors` int(2) NOT NULL DEFAULT '0',
  `gateway_id` varchar(64) NOT NULL DEFAULT '*',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 /*!40100 DEFAULT CHARSET=utf8*/;

DROP TABLE IF EXISTS `outgoing_sms_content_groups` ;
create table `outgoing_sms_content_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `group_name` varchar(255) NOT NULL,
   `sms_content` text NOT NULL,
    `created_at` timestamp ,
    `updated_at` timestamp ,
   PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `outgoing_sms_number_groups` ;
create table `outgoing_sms_number_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `group_name` varchar(255) NOT NULL,
   `phone_numbers` text NOT NULL,
    `created_at` timestamp ,
    `updated_at` timestamp ,
   PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `users` ;
create table `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(255) not null,
   `user_name` varchar(255) not null,
    `created_at` timestamp ,
    `updated_at` timestamp ,
   PRIMARY KEY (`id`)
 );

insert into users(password,user_name) values( '21f8c82e5df6e291a325e2266fec49f54107c12c','smslib' );
