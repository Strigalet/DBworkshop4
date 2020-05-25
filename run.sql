SET SERVEROUTPUT ON;
--ПОЖАЛУЙСТА ЗАПУСТИТЕ ФАЙЛ package.sql


SELECT * FROM TABLE(my_package.GetAvgMark(1991,'RUS'));           -- Работоспособность функции
SELECT * FROM TABLE(my_package.GetAvgMark(2012,'USA'));
     
     
    
INSERT INTO Participation(year,participant_id) VALUES (2032, 1);           -- Работоспособность триггера


DECLARE
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
    
    dbms_output.put_line(' ');
    dbms_output.put_line('AFTER:');
    FOR record IN Participant_Solution
     LOOP
        DBMS_OUTPUT.put_line('Participant_id - ' || record.participant_id || ' | Problem_id - ' || record.problem_id || ' | Solution - ' || record.solution);
     END LOOP;
     dbms_output.put_line(' ');
     dbms_output.put_line('Procedure exceptions: ');
     Add_Participant_Solution(15,2,'yareshil');  	--Participant not found
     Add_Participant_Solution(2,15,'solutionenko');	--Problem not found
     
     
     
        
END;
