# encoding: utf-8
def update_failure_status
	Commitment.where(status:"D", is_completed:false).each do |commitment|
		commitment.status = "F"
		commitment.save
	end
end

def update_success_status
	Commitment.where(status:"D", is_completed:true).each do |commitment|
		commitment.status = "S"
		commitment.save
	end
end

namespace :determine_commitment do
	desc "determine commitment"
	task :all => :environment do
		update_failure_status
		update_success_status
	end

	desc "update the commitment by failure status"
	task :failure => :environment do
		update_failure_status
	end

	desc "update the commitment by success status"
	task :success => :environment do
		update_success_status
	end
end
