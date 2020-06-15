What are the disadvantages of adding an index to a table column in a database?


Given the following table write all the `belongs_to` and `has_many` associations
for models based on the below table (`User`, `Enrollment`, and `Course`)

```ruby

# == Schema Information
#
# Table name: users
#
#  id   :integer                not null, primary key
#  name :string                 not null

            class User < ApplicatioRecord
                has_many :enrollment,
                        primary_key: :id,
                        foreign_key: :student_id,
                        class_name: :Enrollment

                has_many :courses_taught,
                    primary_key: :id,
                    foregin_key: :professor_id,
                    class_name: :Course

            end

# Table name: enrollments
#
#  id   :integer                not null, primary key
#  course_id :integer           not null
#  student_id :integer          not null

            class Enrollment < ApplicationRecord

                belongs_to :course,
                    primary_key: :id,
                    foreign_key: :course_id,
                    class_name: :Course

                belongs_to :student,
                        primary_key: :id,
                        foreign_key: :student_id,
                        class_name: :User
            end

# Table name: courses
#
#  id   :integer                not null, primary key
#  course_name :string          not null
#  professor_id :integer        not null
#  prereq_course_id :integer    not null

            class Course < ApplicationRecord
                has_many :enrollments,
                    primary_key: :id,
                    foreign_key: :course_id,
                    class_name: :Enrollment
                
                belongs_to :professor,
                    primary_key: :id,
                    foregin_key: :professor_id,
                    class_name: :User

                belongs_to :prereq,
                    primary_key: :id,
                    foreign_key: :prereq_course_id,
                    class_name: :Course
                    optional: true

 
                
            end

Given all possible SQL commands order by order of query execution. (#SELECT,
#DISTINCT, #FROM, #JOIN, WHERE, GROUP BY, HAVING, #LIMIT/OFFSET, #ORDER).
            1) JOIN/FROM
            2) WHERE
            3) GROUP BY
            4) HAVING
            5) SELECT
            6) DISTINCT
            7) ORDER BY
            8) LIMIT/OFFSET
            JOIN the band FROM WHERE they GROUP BY their instuments HAVING practiced SELECT
            DISTINCT ORDERs BY their LIMIT and OFFSET.

Given the following table:

```ruby
# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

```

Write the following SQL Query:

1.  In which years was the Physics prize awarded, but no Chemistry prize?

SELECT yr
FROM nobels
WHERE (subject = 'Physics' AND yr NOT IN (
        SELECT yr
        FROM nobels
        WHERE subject = 'Chemisty'
))

What is the purpose of a database migration?
A migration is a file containing Ruby code that describes a set of
changes to be applied to a database. It may create or drop tables as well as add
or remove columns from a table.


What is the difference between Database Constraints and Active Record
Validations?
**Answer**: **Validations** are defined inside **models**. Model-level
validations live in the Rails world. Since we write them in Ruby, they are very
flexible, database agnostic, and convenient to test, maintain and reuse.
Validations are run whenever we `save` or `update` a model. **Constraints** are
defined inside **migrations** and operate on the database. Constraints throw
hard nasty errors whenever something that shouldn't be inputted into our
database tries to get in there.



Given the following table write all the `belongs_to` and `has_many` associations
for models based on the below table (`User`, `Game`, and `Score`)

```ruby
# == Schema Information
#
# Table name: user
#
#  id   :integer          not null, primary key
#  name :string           not null
    class User < ApplicationRecord
        has_many :scores
            primary_key: :id,
            foreign_key: :user_id,
            class_name: :Score

        has_many :games_made,
            primary_key: :id,
            foreign_key: :game_maker_id,
            class_name: :Game

    end

# Table name: score
#
#  id   :integer           not null, primary key
#  number :integer         not null
#  user_id :integer        not null
#  game_id :integer        not null
    class Score < ApplicationRecord       

        belongs_to :User,
            primary_key: :id,
            foreign_key: :user_id,
            class_name: :User

        belongs_to :game,
            primary_key: :id,
            foreign_key: :game_id,
            class_name: :Game

    end
# Table name: game
#
#  id   :integer           not null, primary key
#  name :string            not null
#  game_maker_id :integer  not null 

    class Game < ApplicationRecord
        has_many :scores,
            primary_key: :id,
            foreign_key: :game_id,
            class_name: :Score

        belongs_to :game_maker,
            primary_key: :id,
            foreign_key: :game_maker_id,
            class_name: :User
    end