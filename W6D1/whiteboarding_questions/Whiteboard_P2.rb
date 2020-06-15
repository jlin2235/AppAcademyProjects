You are given a PostgreSQL database with two tables: the first is an `employees`
table and the second is a `departments` table. Employees can belong to a single
department.

1.  Write a SQL query that, given a department name, finds all the employees
    `name`s that are in that department.

2.  Next find the name of the employees that don't belong to any department`

1) SELECT
    employees.name
    FROM
    employees
    JOINS
    departments ON department_id = departments.id
    WHERE
    ? = departments.name

2) SELECT
    employees.name
    FROM 
    employees
    WHERE 
    department_id IS NULL

Describe the differences between a primary key and a foreign key.


## Question Three:

Given the following table write all the `belongs_to` and `has_many` **and**
`has_many through` associations for models based on the below table
(`Physician`, `Appointment`, and `Patient`)

```ruby
# == Schema Information
#
# Table name: physicians
#
#  id   :integer          not null, primary key
#  name :string           not null

Class Physician < ApplicationRecord
    has_many :primary_patients,
    class_name: :Patient,
    primary_id: :id,
    foreign_id: primary_physician_id

    has_many :appointments,
        class_name: :Appointment,
        primary_key: :id,
        foreign_key: :physician_id

    has_many :general_patients
        through: :appointments,
        source: :patient

    has_many :primary_patient_appointments,
        through: :primary_patients,
        source: :appointments

    

end


# Table name: appointments
#
#  id   :integer           not null, primary key
#  physician_id :integer   not null
#  patient_id :integer     not null

class Appointment << ApplicationRecord
    belongs_to :patient,
        class_name: :Patients,
        primary_key: :id,
        foreign_key: patient_id

    belongs_to :physician,
        class_name: :Physician,
        primary_key: :id,
        foreign_key: :physician_id
end

# Table name: patients
#
#  id   :integer           not null, primary key
#  name :string            not null
#  primary_physician_id :integer

class Patient < ApplicationRecord
    belongs_to :primary_physician
        class_name: :Physician,
        primary_id: :id,
        foreign_id: :primary_physician_id

        has_many :appointments
            class_name: :Appointment,
            primary_id: id:,
            foreign_id: :patient_id




end

Paraphrase the advantages of using an ORM (like ActiveRecord).
Using an ORM (Object Relational Model) allows you to interact with
database information in an OOP way. An ORM like ActiveRecord will translate rows
from your SQL tables into Ruby objects on fetch, and translates your Ruby
objects back to rows on save resulting in less overall database access code.


When are model validations run?
Whenever a model instance is _updated_ or _saved_ to the database.


# Question Six:

Given the following Schema:

```ruby

# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer
```

Write two SQL Queries:

1.  List the films where 'Harrison Ford' has appeared - but not in the star
    role.
    - **Note:** the `ord` field of casting gives the position of the actor. If
      `ord=1` then this actor is in the starring role
2.  Obtain a list in alphabetical order of actors who've had at least 15
    starring roles.

    1) SELECT
        movies.title
        FROM
        movies
        JOIN
        castings ON castings.movie_id = movies.id
        JOIN 
        actors ON castings.actor_id = actors.id
        WHERE
        (actors.name = 'Harrison Ford' AND castings.ord != 1);

        2) SELECT
            actors.name
            FROM
            actors
            JOIN
            castings on castings.actor_id = actors.id
            WHERE
                castings.ord = 1
            GROUP BY
                actors.name
            HAVING
                COUNT(*) >= 15
                ORDER BY
                actors.name ASC;


## Question Seven:

Identify the difference between a `has_many through` and a `has_one`
association?