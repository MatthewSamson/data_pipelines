create or replace function sql_script() returns void as $$
		
	begin
		create table topics(code integer, topic_name char(50));
		insert into topics values(301, 'Machine learning');
		insert into topics values(302, 'Databases');
		insert into topics values(303, 'Big Data');
		insert into topics values(304, 'Programming languages');
		
		create table projects(project_number integer, project_name char(100), code integer);
		insert into projects values(10001, 'A unified database structure for structured/unstructured/semistructured data', 302);
		insert into projects values(10001, 'A unified database structure for structured/unstructured/semistructured data', 303);
		insert into projects values(10002, 'Advanced Machine learning in analyzing crop images', 301);
		insert into projects values(10003, 'Efficient functional programming in Big Data', 303);
		insert into projects values(10003, 'Efficient functional programming in Big Data', 304);
		
		create table reports(report_number integer, title char(100), code integer);
		insert into reports values(552, 'A space efficient data warehouse', 302);
		insert into reports values(552, 'A space efficient data warehouse', 303);
		insert into reports values(554, 'Computer vision based crop growth monitoring', 301);
		insert into reports values(561, 'Automated data extraction in big data analytics', 302);
		insert into reports values(561, 'Automated data extraction in big data analytics', 303);
		insert into reports values(565, 'A new hashing structure for large key-value data sets', 303);
		insert into reports values(577, 'Yet another language for big data analysis', 303);
		insert into reports values(577, 'Yet another language for big data analysis', 304);
		
		
		create table funding_agencies(fund_name char(10), address char(50), phone_number char(12));
		insert into funding_agencies values('NSERC', '350 Albert Street, Ottawa, ON K1A 1H5', '613-995-4273');
		insert into funding_agencies values('OMAFRA', '1 Stone Road West, Guelph, ON N1G 4Y2', '519-826-3100');	
		
		create table grants(grant_no integer, amount integer, period char(9), fund_name char(10), project_number integer);
		insert into grants values(6733, 10000, '2019-2020', 'NSERC', 10001);
		insert into grants values(2355, 80000, '2019-2022', 'OMAFRA', 10002);
		insert into grants values(3744, 15000, '2018-2019', 'NSERC', 10001);
		insert into grants values(6347, 20000, '2017-2020', 'NSERC', 10003);
		insert into grants values(9877, 35000, '2019-2022', 'OMAFRA', 10002);
		
		create table researchers(researcher_id integer, researcher_name char(20), researcher_phone char(10), office char(10), email char(50), project_number integer, report_number integer, is_PI integer);
		insert into researchers values(102323, 'James', 'X52838', 'REY3203', 'james@uoguelph.ca', 10002, 554, 0);
		insert into researchers values(103946, 'Jones', 'X53371', 'REY3101', 'jones@uoguelph.ca', 10001, 552, 0);
		insert into researchers values(103946, 'Jones', 'X53371', 'REY3101', 'jones@uoguelph.ca', 10001, 561, 0);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10001, 552, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10001, 561, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10001, 565, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10001, 577, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10003, 552, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10003, 561, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10003, 565, 1);
		insert into researchers values(117673, 'White', 'X56652', 'REY2331', 'white@uoguelph.ca', 10003, 577, 1);
		insert into researchers values(134262, 'Brown', 'X53342', 'REY3228', 'brown@uoguelph.ca', 10002, 554, 1);
		insert into researchers values(106469, 'Green', 'X54693', 'REY2044', 'green@uoguelph.ca', 10003, 577, 0);
		insert into researchers values(225320, 'Murry', 'X52289', 'REY2388', 'murry@uoguelph.ca', 10002, 554, 0);
		insert into researchers values(324201, 'Smith', 'X54334', 'REY3781', 'smith@uoguelph.ca', 10003, 577, 0);
		insert into researchers values(849171, 'Field', 'X56381', 'REY3544', 'field@uoguelph.ca', 10001, 552, 0);
		insert into researchers values(849171, 'Field', 'X56381', 'REY3544', 'field@uoguelph.ca', 10001, 565, 0);

	end;

$$ language plpgsql;
