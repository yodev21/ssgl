class Mentor::User < ApplicationRecord
  scope :mentor_users_answer, lambda { |current_user_id|
    sql = "
    SELECT 
      users.id,
      users.name,
      users.image,
      assigns.team_id,
      answers.id AS ansewr_id
    FROM users
      INNER JOIN assigns
        ON users.id = assigns.user_id
      INNER JOIN challenge_courses
        ON assigns.user_id = challenge_courses.user_id
      INNER JOIN challenge_starts
        ON challenge_courses.user_id = challenge_starts.user_id
      INNER JOIN answers
        ON challenge_starts.user_id = answers.user_id
    WHERE assigns.team_id = :current_user_id
    "
    find_by_sql([sql, {current_user_id: current_user_id}])
  }
end
