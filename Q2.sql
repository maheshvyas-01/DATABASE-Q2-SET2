CREATE TABLE seat (
    id INT PRIMARY KEY,
    student VARCHAR(255)
);

INSERT INTO seat (id, student) VALUES
(1, 'Rahul Sharma'),
(2, 'Anita Verma'),
(3, 'Suresh Kumar'),
(4, 'Priya Singh'),
(5, 'Deepak Patel'),
(6, 'Ravi Mehta'),
(7, 'Neha Gupta'); 

WITH SwappedSeats AS (
    SELECT 
        CASE 
            WHEN id % 2 = 1 AND LEAD(id) OVER (ORDER BY id) IS NOT NULL 
			THEN LEAD(id) OVER (ORDER BY id)
            WHEN id % 2 = 0 
			THEN LAG(id) OVER (ORDER BY id)
            ELSE id
        END AS new_id,
        student
    FROM seat
)
SELECT new_id AS id, student
FROM SwappedSeats
ORDER BY id;
