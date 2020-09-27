class AddChallengeCourseToLimitedReleaseEnabled < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_courses, :limited_release_enabled, :boolean, null: false, default: false
  end
end
