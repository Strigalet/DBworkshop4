CREATE OR REPLACE VIEW Country_Mark_By_Year AS
SELECT
   countryname,
   mark,
   year
FROM Participant 
		JOIN Solution ON 
			Participant.participant_id = Solution.participant_id
		JOIN Participation ON
			Participant.participant_id = Participation.participant_id

			