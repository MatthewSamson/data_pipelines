create or replace function func_q4b() returns void as $$

	declare
	
		f1 cursor for select distinct researcher_id, researcher_name, is_pi
		from researchers
		order by researcher_id;
		
		the_id integer;
		the_name char(20);
		the_pi integer;
		tot_amt integer;
		
		f2 cursor for select sum(amount)
		from (select distinct researcher_id, researcher_name, amount
              from researchers, grants
		      where researchers.project_number = grants.project_number
		      order by researcher_id) as que1
		where researcher_id = the_id;

	begin
	
		open f1;
		loop
		
			fetch f1 into the_id, the_name, the_pi;
			exit when not found;
			if (the_pi = 1) then
				open f2;
					
					fetch f2 into tot_amt;
					raise notice 'Researcher ID: %', the_id;
					raise notice 'Researcher Name: %', the_name;
					raise notice 'Total funding amount: %', tot_amt;
	
				close f2;
			
			else
				raise notice 'Researcher ID: %', the_id;
				raise notice 'Researcher Name: %', the_name;
				raise notice 'Total funding amount: Not Available';
					
			end if;
			raise notice '********************************************';
			
		end loop;
		close f1;
		
	end;

$$ language plpgsql;
					
					
		
