create database `cab`;
use `cab`;
create table `cab_details`(
	`cab_no` varchar(15) primary key,
	`cab_model` varchar(50) not null,
	`cab_description` varchar(50) not null,
	`cab_capacity` tinyint not null
);
select * from `cab_details`;
desc `cab_details`;
create table `passenger`(`psngr_id` int primary key,
	`name`varchar(50) not null,
	`address`varchar(100) not null,
	`contact_no`bigint not null,
	`email` varchar(100) not null unique,
	`dob`date not null,
	`gender`varchar(15) not null,
	`username`varchar(50) not null unique,
	`password`varchar(20) not null
	);
select * from `passenger`;
desc `passenger`;
create table `driver`(
	`drvr_id`int primary key,
	`name`varchar(50) not null, 
	`address`varchar(100) not null,
	`contact_no`bigint not null,
	`email`varchar(100) not null unique,
	`gender`varchar(20) not null,
	`vehicle_no`varchar(15) not null,
	 foreign key (`vehicle_no`) references`cab_details`(`cab_no`),
	`license_no`varchar(20) not null unique,
	`username`varchar(50) not null,
	`password`varchar(20) not null
	);
select * from `driver`;
desc driver;
create table `route`(
	`route_id`varchar(20) primary key,
	`from`varchar(50) not null,
	`to`varchar(50) not null,
	`rate`int not null
	);
select * from`route`;
desc`route`;
create table `bookings`(
`booking_id` int primary key,
`psngr_id` int not null,
foreign key(`psngr_id`)references`passenger`(`psngr_id`),
`drvr_id` int not null,
foreign key(`drvr_id`)references`driver`(`drvr_id`),
`route_id` varchar(20) not null,
foreign key(`route_id`) references`route`(`route_id`),
`booking_date` date not null,
`booking_time` time not null,
`travel_date` date not null,
`travel_time` time not null,
`vehicle_no` varchar(15) not null,
foreign key(`vehicle_no`)references`cab_details`(`cab_no`)
);
select * from `bookings`;
desc `bookings`;