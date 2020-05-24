CREATE OR REPLACE FUNCTION HigherAvgMarkByYearAndCountry (
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
