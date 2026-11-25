CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(160) NOT NULL UNIQUE,
    enrollment_date DATE NOT NULL
);

CREATE TABLE club (
    club_id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE,
    description TEXT,
    founded_date DATE NOT NULL
);

CREATE TABLE event (
    event_id SERIAL PRIMARY KEY,
    club_id INTEGER NOT NULL REFERENCES club(club_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL,
    ticket_fee NUMERIC(10, 2) NOT NULL DEFAULT 0.00 CHECK (ticket_fee >= 0)
);

CREATE TABLE club_membership (
    club_membership_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
    club_id INTEGER NOT NULL REFERENCES club(club_id) ON DELETE CASCADE,
    joined_date DATE NOT NULL,
    role_name VARCHAR(60) NOT NULL DEFAULT 'member',
    CONSTRAINT uq_student_club_membership UNIQUE (student_id, club_id)
);

CREATE TABLE event_registration (
    event_registration_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
    event_id INTEGER NOT NULL REFERENCES event(event_id) ON DELETE CASCADE,
    registered_at DATE NOT NULL,
    attendance_status VARCHAR(40) NOT NULL DEFAULT 'registered',
    CONSTRAINT uq_student_event_registration UNIQUE (student_id, event_id)
);
