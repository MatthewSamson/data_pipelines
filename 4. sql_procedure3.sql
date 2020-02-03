create or replace function func_q4c(p_no integer, p_name char(100), t_code integer, id_pi integer,
 g_no integer, amt integer, period char(9), agency char(10)) returns void as $$
 
	declare
		
		r_name char(20);
		r_phone char(10);
		r_office char(10);
		r_email char(50);
		r_no integer;
		
		f1 cursor for select researcher_name, phone, office, email
		from researchers
		where researchers.researcher_id = id_pi;
		
		f2 cursor for select report_number
		from reports
		where reports.code = t_code;
		
	begin
		
		open f1;
		loop
			
			fetch f1 into r_name, r_phone, r_office, r_email;
			exit when not found;
		
		end loop;
		close f1;
			
		open f2;
		loop
		
			fetch f2 into r_no;
			exit when not found;
			
		end loop;
		close f2;
		
		insert into projects values(p_no, p_name, t_code);
		insert into grants values(g_no, amt, period, agency, p_no);	
		insert into researchers values(id_pi, r_name, r_phone, r_office, r_email, p_no, r_no, 1);
		raise notice 'New project inserted into the relation: projects!';
		raise notice 'New grant inserted into the relation: grants!';
		raise notice 'New values are inserted into the relation: researchers!';
			
		
		
	end;
	
$$ language plpgsql
