CREATE TYPE AveragePeople IS OBJECT (
        firstname   participant.firstname%TYPE,
        lastname    participant.lastname%TYPE,
        avg_mark    Participants_Avg_Mark.avg_mark%TYPE
    );
/
CREATE TYPE TableAveragePeople IS
        TABLE OF AveragePeople;
/
CREATE OR REPLACE FUNCTION GetAvgMark (
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
