class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.reference :category # has_many, belongs_toの関連付けに加え、FKはreferenceで関連付け
      t.reference :user
      t.integer :user_id
      t.integer :result

      t.timestamps
    end
  end
end
