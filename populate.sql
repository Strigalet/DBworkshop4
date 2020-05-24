INSERT INTO country (countryname) VALUES ('RUS');
INSERT INTO country (countryname) VALUES ('UKR');
INSERT INTO country (countryname) VALUES ('USA');


INSERT INTO olympiad (year) VALUES (1991);
INSERT INTO olympiad (year) VALUES (2012);


INSERT INTO participant (participant_id, firstname, lastname, countryname) VALUES (1, 'Ilya', 'Pivcaev', 'RUS');
INSERT INTO participant (participant_id, firstname, lastname, countryname) VALUES (2, 'Aleksandr', 'Dashkevich', 'UKR');
INSERT INTO participant (participant_id, firstname, lastname, countryname) VALUES (3, 'Artour', 'Babaev', 'USA');
INSERT INTO participant (participant_id, firstname, lastname, countryname) VALUES (4, 'Danil', 'Ishutin', 'UKR');

INSERT INTO participation (participant_id , year) VALUES (1, 1991);
INSERT INTO participation (participant_id , year) VALUES (2, 1991);
INSERT INTO participation (participant_id , year) VALUES (3, 2012);
INSERT INTO participation (participant_id , year) VALUES (4, 2012);

INSERT INTO problem (problem_id, year) VALUES (1, 1991);
INSERT INTO problem (problem_id, year) VALUES (2, 1991);
INSERT INTO problem (problem_id, year) VALUES (3, 2012);
INSERT INTO problem (problem_id, year) VALUES (4, 2012);
INSERT INTO problem (problem_id, year) VALUES (5, 1991);
INSERT INTO problem (problem_id, year) VALUES (6, 2012);

INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (1, 1, 'solution1', 5);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (1, 2, 'solution2', 7);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (2, 1, 'solution3', 4);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (2, 2, 'solution4', 0);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (3, 3, 'solution5', 6);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (3, 4, 'solution6', 1);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (4, 3, 'solution7', 4);
INSERT INTO solution ( participant_id, problem_id, solution, mark) VALUES (4, 4, 'solution8', 5);
