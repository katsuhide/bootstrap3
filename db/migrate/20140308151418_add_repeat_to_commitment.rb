class AddRepeatToCommitment < ActiveRecord::Migration
  def change
    add_column :commitments, :repeat, :boolean
  end
end
