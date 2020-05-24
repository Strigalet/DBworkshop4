SET SERVEROUTPUT ON;


 
DECLARE
 
counter INT;
 
CURSOR Participant_Solution
IS
    SELECT
         participant_id, problem_id, solution
    FROM
        Solution;
 
BEGIN
    dbms_output.put_line('BEFORE:');
    FOR record IN Participant_Solution
     LOOP
			
        DBMS_OUTPUT.put_line('Participant_id - ' || record.participant_id || ' | Problem_id - ' || record.problem_id || ' | Solution - ' || record.solution);
     END LOOP;
     
    Add_Participant_Solution(1,1,'solevar');
    Add_Participant_Solution(2,2,'solenko');
    
    dbms_output.put_line('AFTER:');
    FOR record IN Participant_Solution
     LOOP
			
        DBMS_OUTPUT.put_line('Participant_id - ' || record.participant_id || ' | Problem_id - ' || record.problem_id || ' | Solution - ' || record.solution);
     END LOOP;
     
     counter := HigherAvgMarkByYearAndCountry(1991,'RUS');
     dbms_output.put_line('Result - ' || counter);
     
        
END;
