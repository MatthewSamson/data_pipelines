create or replace function func_q4a(re_id integer) 
	returns table (num integer, atitle char(100), acode integer) as $$

	declare
	
		f1 cursor for select reports.report_number, title, code
		from reports, researchers
		where reports.report_number = researchers.report_number and researcher_id = re_id;
		
		r_no integer; 
		r_title char(100); 
		t_code integer;
		
		
		
	begin
		create table q4_ans(num integer, atitle char(100), acode integer);
		
		open f1;
		loop
		
			fetch f1 into r_no, r_title, t_code;
			exit when not found;
			raise notice 'Report Number: %', r_no;
			raise notice 'Report Title: %', r_title;
			raise notice 'Topic Code: %', t_code;
			raise notice '************************************************ ';
			insert into q4_ans values(r_no, r_title, t_code);
		
		end loop;
		close f1;
	
	return query select * from q4_ans;
	drop table q4_ans;
	raise notice 'Table of the required results are displayed below!';
	end;

$$ language plpgsql;
