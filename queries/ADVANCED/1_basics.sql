-- PostgreSQL COMMANDS

-- creating a new table

CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status_job VARCHAR(50)
);

-- display 
SELECT * FROM job_applied;


INSERT INTO job_applied
        (job_id,
         application_sent_date,
         custom_resume,
         resume_file_name,
         cover_letter_sent,
         cover_letter_file_name,
         status_job)
VALUES  (1,
        '2025-12-22',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'Submitted'),

        (2,
        '2025-12-21',
        false,
        'resume_02.pdf',
        false,
        'cover_letter_02.pdf',
        'Rejected'),

        (3,
        '2025-12-22',
        true,
        'resume_03.pdf',
        true,
        'cover_letter_03.pdf',
        'Cleared interview, HR pending'),

        (4,
        '2025-12-22',
        true,
        'resume_04.pdf',
        true,
        'cover_letter_04.pdf',
        'Offered'),

        (5,
        '2025-12-22',
        true,
        'resume_05.pdf',
        false,
        'cover_letter_05.pdf',
        'Rejected because resume not sent.'
        );

ALTER TABLE job_applied
ADD contact VARCHAR(50)

UPDATE job_applied
set contact = 'Rahul Reddy'
where job_id = 1;


UPDATE job_applied
set contact = 'Lewis Hamilton'
where job_id = 2;


UPDATE job_applied
set contact = 'Charles LeClerc'
where job_id = 3;


UPDATE job_applied
set contact = 'Oscar Piastri'
where job_id = 4;


UPDATE job_applied
set contact = 'Max Verstappen'
where job_id = 5;

ALTER TABLE job_applied
RENAME column contact TO contact_name;

ALTER TABLE job_applied
ALTER column contact_name type text;

ALTER TABLE job_applied
drop col

drop table job_applied