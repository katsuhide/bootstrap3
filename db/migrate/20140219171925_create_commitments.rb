class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.string :title
      t.boolean :is_completed
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
