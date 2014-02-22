# encoding: utf-8

API_KEY = ENV['MAILGUN_API_KEY']
DOMAIN = ENV['MAILGUN_DOMAIN']
API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/#{DOMAIN}"

# send mail
def send_mail(mail, to_address)
	RestClient.post API_URL+"/messages",
	:from => "no-reply@#{DOMAIN}",
	:to => to_address,
	:subject => mail['subject'],
	:text => mail['text']

end

# create remind mail
def create_remind_mail
	mail = Hash.new()
	mail['subject'] = "Committer Remind Mail"
	mail['text'] = <<-EOS
コミットメントを登録しましょう！
今日も１日頑張るで〜
EOS

	return mail
end

# create result mail
def create_result_mail
	today = (Time.now - 24*60*60).strftime("%Y-%m-%d")
	# get failed task
	failed_task = []
	Commitment.where(status:"F", due_date:today).each do |commitment|
		failed_task.push(commitment.title)
	end

	# get succeeded task
	succeeded_task = []
	Commitment.where(status:"S", due_date:today).each do |commitment|
		succeeded_task.push(commitment.title)
	end

	body = <<-EOS
■□---------------□■
	Success
■□---------------□■
EOS

	succeeded_task.each do |task|
		body += (task + "\r\n")
	end

	body += <<-EOS

■□---------------□■
	Failure
■□---------------□■
EOS

	failed_task.each do |task|
		body += (task + "\r\n")
	end

	mail = Hash.new()
	mail['subject'] = "Committer Result Mail"
	mail['text'] = body

	return mail
end

namespace :send_mail do
	desc "send mail for remind to register commitments"
	task :remind => :environment do
		send_mail(create_remind_mail, "kamonegi.gg@gmail.com")
	end

	desc "send mail for today's result"
	task :result => :environment do
		send_mail(create_result_mail, "kamonegi.gg@gmail.com")
	end

end
