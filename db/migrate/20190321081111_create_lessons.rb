class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :category # has_many, belongs_toの関連付けに加え、FKはreferencesで関連付け
      t.references :user
      t.integer :user_id
      t.integer :result

      t.timestamps
    end
  end
end
