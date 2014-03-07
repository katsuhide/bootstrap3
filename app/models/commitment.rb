class Commitment < ActiveRecord::Base
	scope :search_by_user_id, -> (current_user_id){where(:user_id => current_user_id).order("id desc")}
	scope :search_by_date, -> (search_date) {where(:due_date => search_date).order("id desc")}
end
