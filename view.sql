CREATE OR REPLACE VIEW Participants_Avg_Mark AS
SELECT
        firstname,
        lastname,
        countryname,
        year,
        SUM(mark)/COUNT(mark) avg_mark
    FROM
        Participant 
        JOIN Solution ON participant.participant_id = solution.participant_id
        JOIN Participation ON participant.participant_id = participation.participant_id
        
GROUP BY firstname, lastname,countryname,year
