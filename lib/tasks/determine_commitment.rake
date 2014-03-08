# encoding: utf-8
def update_failure_status
	today = Date.today;
	Commitment.where("status = ? and is_completed = ? and  due_date < ?", "D", false, today).each do |commitment|
		commitment.status = "F"
		commitment.save
	end
end

def update_success_status
	today = Date.today;
	Commitment.where("status = ? and is_completed = ? and  due_date < ?", "D", true, today).each do |commitment|
		commitment.status = "S"
		commitment.save
	end
end

def rollover_commitment
	today = Date.today;
	Commitment.where(repeat:true, due_date: today - 1).each do |commitment|
		new_commitment = Commitment.new
		new_commitment.attributes = commitment.attributes
		new_commitment.id = nil
		new_commitment.status = "D"
		new_commitment.due_date = today
		new_commitment.save
	end
end

namespace :determine_commitment do
	desc "determine commitment"
	task :all => :environment do
		update_failure_status
		update_success_status
		rollover_commitment
	end

	desc "update the commitment by failure status"
	task :failure => :environment do
		update_failure_status
	end

	desc "update the commitment by success status"
	task :success => :environment do
		update_success_status
	end

	desc "rollover the repaet commitment"
	task :rollover => :environment do
		rollover_commitment
	end
end
