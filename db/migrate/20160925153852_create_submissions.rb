class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :assignment, index: true, foreign_key: true, null: false
      t.text :answer, null: false
    end
  end
end
