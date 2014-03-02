class AddUserToCommitment < ActiveRecord::Migration
  def change
    add_reference :commitments, :user, index: true
  end
end
