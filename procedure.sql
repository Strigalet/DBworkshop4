BEGIN
    DBMS_OUTPUT.enable;
END;
/
SET SERVEROUTPUT ON;



CREATE OR REPLACE PROCEDURE Add_Participant_Solution (
	
		par_participant_id Participant.participant_id%TYPE,
		par_problem_id Problem.problem_id%TYPE,
		par_solution Solution.solution%TYPE,
		par_mark INT
    )
	AS 
		var_participant_id Participant.participant_id%TYPE;
		var_problem_id Problem.problem_id%TYPE;
		problem_or_participant_not_found EXCEPTION;
    
	BEGIN
		
		SELECT COUNT(*)	INTO var_participant_id
    		FROM participant
    		WHERE participant_id = par_participant_id;
    
    		SELECT COUNT(*)	INTO var_problem_id
    		FROM problem
    		WHERE problem_id = par_problem_id;


    		IF (var_participant_id = 1)  and (var_problem_id = 1) THEN
    			INSERT INTO solution (solution, participant_id, problem_id, mark) VALUES (par_solution, par_participant_id, par_problem_id, par_mark);

    		ELSE
    			RAISE problem_or_participant_not_found;
    		
    		END IF;

    		EXCEPTION
    			WHEN problem_or_participant_not_found THEN
    				dbms_output.put_line('Participant or problem not found');

END;
