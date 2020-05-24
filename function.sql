CREATE OR REPLACE FUNCTION countSolvedProblemsByCountryAndByYear (
    par_year        participation.year%TYPE,
    par_countryname   participant.countryname%TYPE
) RETURN INT
AS
    var INT;
BEGIN 
    SELECT COUNT(mark) 
    INTO var 
    FROM Country_Mark_By_Year 
    WHERE year = par_year AND
          countryname = par_countryname AND
          mark = 7;

    RETURN var;
END;