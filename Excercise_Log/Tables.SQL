CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("running", 10, 100, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("running", 10, 100, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("kung-Fu", 120, 360, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("Kung-Fu", 120, 360, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("walking", 60, 80, 85);
INSERT INTO excercise_logs(type, minutes, calories, heart_rate) VALUES ("Yoga", 20, 40, 40);
INSERT INTO excercise_logs(type, minutes, calories, heart_rate) VALUES ("Yoga", 60, 80, 40);

SELECT * FROM exercise_logs;

SELECT type, SUM(calories) AS total_calories FROM exercise_logs GROUP BY type;

SELECT type, SUM(calories) AS total_calories FROM exercise_logs
    GROUP BY type
    HAVING total_calories > 150
    ;
SELECT type, AVG(calories) AS avg_calories FROM exercise_logs
    GROUP BY type
    HAVING avg_calories > 70
    ; 
    
SELECT type FROM exercise_logs GROUP BY type HAVING COUNT(*) >= 2;
SELECT COUNT(*) FROM exercise_logs
WHERE heart_rate > 220 - 22;

/* target heart rate 50-90% of max */
SELECT COUNT(*) FROM exercise_logs WHERE
    heart_rate >= ROUND(0.50 * (220-22)) 
    AND  heart_rate <= ROUND(0.90 * (220 - 22));

/* CASE */
SELECT COUNT(*),
    CASE 
        WHEN heart_rate > 220-30 THEN "above max"
        WHEN heart_rate > ROUND(0.90 * (220-30)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220-30)) THEN "within target"
        ELSE "below target"
       END as "hr_zone"
  FROM excercise_logs
  GROUP BY hr_zone
        
        
        
CREATE TABLE physio_recommend
    (id INTEGER PRIMARY KEY,
    type TEXT,
    reason TEXT);
    
INSERT INTO physio_recommend(type, reason) VALUES ("walking", "Improves endurance and cardiovascular health.");
INSERT INTO physio_recommend(type, reason) VALUES ("running", "Increases cardiovascular health.");
INSERT INTO physio_recommend(type, reason) VALUES ("kung-Fu", "Increase cardiovascular and co-ordination.");

SELECT type FROM physio_recommend;

/* IN */

SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM physio_recommend);
    
SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM physio_recommend WHERE reason = "Increases cardiovascular health");
    
/* LIKE */

SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM physio_recommend WHERE reason LIKE "%cardiovascular%");
