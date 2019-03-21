class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :word
      # t.integer :word_id
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
