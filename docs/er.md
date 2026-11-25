# ER Diagram
# ER Diagram & Database Scenario

## Domain Scenario
This database models a **University Student Club & Event Management System**. The system tracks registered students, student clubs, club memberships with member roles, events organized by clubs, and student registrations for those events.

## Entities & Business Rules
1. **Student (`student`)**: Represents university students (`student_id`, `full_name`, `email`, `enrollment_date`). Each student has a unique email address.
2. **Club (`club`)**: Represents student organizations (`club_id`, `name`, `description`, `founded_date`). Each club has a unique name.
3. **Club Membership (`club_membership`)**: Resolves the many-to-many relationship between students and clubs (`club_membership_id`, `student_id`, `club_id`, `joined_date`, `role_name`).
   - A student can join multiple clubs, and a club can have many members.
   - A student cannot join the same club more than once (`UNIQUE (student_id, club_id)`).
   - Each membership defaults to the `'member'` role unless specified otherwise.
4. **Event (`event`)**: Represents activities organized by a specific club (`event_id`, `club_id`, `title`, `event_date`, `ticket_fee`).
   - Each club can organize zero or more events (`1:N` relationship), and each event belongs to exactly one club.
   - If a club is deleted, its events are automatically removed (`ON DELETE CASCADE`).
5. **Event Registration (`event_registration`)**: Tracks which students register for which events.

## Entity-Relationship Diagram (Mermaid)

```mermaid
erDiagram
    STUDENT ||--o{ CLUB_MEMBERSHIP : "enrolls in"
    CLUB ||--o{ CLUB_MEMBERSHIP : "has"
    CLUB ||--o{ EVENT : "organizes"
    STUDENT ||--o{ EVENT_REGISTRATION : "registers for"
    EVENT ||--o{ EVENT_REGISTRATION : "receives"

    STUDENT {
        int student_id PK
        varchar full_name
        varchar email UK
        date enrollment_date
    }

    CLUB {
        int club_id PK
        varchar name UK
        text description
        date founded_date
    }

    CLUB_MEMBERSHIP {
        int club_membership_id PK
        int student_id FK
        int club_id FK
        date joined_date
        varchar role_name
    }

    EVENT {
        int event_id PK
        int club_id FK
        varchar title
        date event_date
        numeric ticket_fee
    }

    EVENT_REGISTRATION {
        int registration_id PK
        int student_id FK
        int event_id FK
    }
isim soyisim : Fatih Ender Kılıçkalkan
öğrenci no : 202502009080
bölüm: yönetim bilişim sistemleri 
github hesabı: fatihender24

