CREATE OR REPLACE PACKAGE Database IS


    PROCEDURE Add_Participant_Solution (
    
        par_participant_id Participant.participant_id%TYPE,
        par_problem_id Problem.problem_id%TYPE,
        par_solution Solution.solution%TYPE,
        par_mark INT
    );

    FUNCTION HigherAvgMarkByYearAndCountry (
    par_year        participation.year%TYPE,
    par_countryname   participant.countryname%TYPE
    ) RETURN INT;

    

END Database;

/

CREATE OR REPLACE PACKAGE BODY Database  IS

    FUNCTION HigherAvgMarkByYearAndCountry (
        par_year        participation.year%TYPE,
        par_countryname   participant.countryname%TYPE
    ) RETURN INT
    AS
         counter INT;
    BEGIN 
        SELECT COUNT(average_mark) 
        INTO counter 
        FROM Country_Mark_By_Year 
        WHERE year = par_year AND
              countryname = par_countryname AND
              average_mark >= 4;

        RETURN counter;
    END;
    
    PROCEDURE Add_Participant_Solution (
    
        par_participant_id Participant.participant_id%TYPE,
        par_problem_id Problem.problem_id%TYPE,
        par_solution Solution.solution%TYPE,
        par_mark INT
    )
    AS 
        var_participant_id Participant.participant_id%TYPE;
        var_problem_id Problem.problem_id%TYPE;
        not_found EXCEPTION;
    
    BEGIN
        
        SELECT COUNT(*) INTO var_participant_id
            FROM participant
            WHERE participant_id = par_participant_id;
    
            SELECT COUNT(*) INTO var_problem_id
            FROM problem
            WHERE problem_id = par_problem_id;


            IF (var_participant_id = 1)  and (var_problem_id = 1) THEN
                INSERT INTO solution (solution, participant_id, problem_id, mark) VALUES (par_solution, par_participant_id, par_problem_id, par_mark);

            ELSE
                RAISE not_found;
            
            END IF;

            EXCEPTION
                WHEN not_found THEN
                    dbms_output.put_line('Participant or problem not found');

END;

END Database;
/
