# encoding: utf-8
namespace :determine_commitment do
	desc "update the commitment by failure status"
	task :failure => :environment do
		Commitment.where(status:"D", is_completed:false).each do |commitment|
			commitment.status = "F"
			commitment.save
		end
	end

	desc "update the commitment by success status"
	task :success => :environment do
		Commitment.where(status:"D", is_completed:true).each do |commitment|
			commitment.status = "S"
			commitment.save
		end
	end
end
