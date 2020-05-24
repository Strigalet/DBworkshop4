CREATE OR REPLACE PACKAGE Database IS
    TYPE AveragePeople IS RECORD (
        firstname      participant.firstname%TYPE,
        lastname   participant.lastname%TYPE,
        avg_mark  INT
    );
    TYPE TableAveragePeople IS
        TABLE OF AveragePeople;
--
    FUNCTION Participants_Avg_Mark_By_Year_And_Country (
        par_year    INT,
        par_countryname    VARCHAR
    ) RETURN TableAveragePeople
        PIPELINED;

    PROCEDURE Add_Participant_Solution (
    
        par_participant_id Participant.participant_id%TYPE,
        par_problem_id Problem.problem_id%TYPE,
        par_solution Solution.solution%TYPE,
        par_mark INT
    );

END Database;

/


CREATE OR REPLACE PACKAGE BODY Database IS

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
               UPDATE Solution
            SET
               solution = par_solution
            WHERE
               participant_id = par_participant_id
               AND
               problem_id = par_problem_id;

            ELSE
                RAISE not_found;
            
            END IF;

            EXCEPTION
                WHEN not_found THEN
                    dbms_output.put_line('Participant or problem not found');

END;


FUNCTION Participants_Avg_Mark_By_Year_And_Country (
        par_year    INT,
        par_countryname    VARCHAR
    ) RETURN TableAveragePeople
        PIPELINED
    IS

        CURSOR curs IS
        (SELECT
            firstname,
            lastname,
            avg_mark
        FROM
            Participants_Avg_Mark
        WHERE
            countryname = par_countryname
            AND year = par_year);
    my_rec AveragePeople;
    BEGIN
        FOR rec IN curs 
        LOOP
            my_rec.firstname := rec.firstname;
            my_rec.lastname := rec.lastname;
            my_rec.avg_mark := rec.avg_mark;
            PIPE ROW ( my_rec );
        END LOOP;
    END;
