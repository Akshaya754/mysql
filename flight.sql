create database flightManagement;
use flightManagement;
create table `flight_details`(
`flight_no`int primary key,
`flight_name` varchar(45) not null,
`flight_destination` varchar(55) not null,
`flight_total_capacity` int not null
);
create table passenger(
`passenger_id` int primary key,
`first_name` varchar(75) not null,
`last_name` varchar(15) not null,
`user_name` varchar(75) not null,
`email` varchar(75) unique not null,
`password` varchar(75) unique not null,
`mobile_number` int not null unique,
`address_housename` varchar(75) not null,
`address_place` varchar(75) not null,
`address_pin` int not null,
`date_of_birth` date not null
);

create table flight_schedule(
`flight_schedule_id` int primary key,
`flight_depature` varchar(50) not null,
`flight_destination` varchar(50) not null,
`flight_date` date not null,
`flight_time` time not nulL,
`flight_charge` int not null,
`flight_no` int,
constraint FK_ID foreign key(flight_no) references flight_details(flight_no)
);

create table ticket_booking(
`ticket_no` int primary key,
`date_of_booking` date not null,
`date_of_travel` date not null,
`flight_schedule_id` int,
constraint FK_SCHEDULE_ID foreign key(flight_schedule_id) references flight_schedule(flight_schedule_id),
`flight_depature` varchar(50) not null,
`flight_destination` varchar(50) not null,
`flight_date` date not null,
`flight_time` time not nulL,
`boarding_time` time not null,
`passenger_id` int,
constraint FK_TICKET_ID foreign key(passenger_id) references passenger(passenger_id)
);
