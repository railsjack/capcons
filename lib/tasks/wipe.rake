namespace :db do
  task wipe: :environment do
  	puts 'Clean users...'
		User.where.not(email: 'admin@gmail.com').each{|u| 
			puts "destroy user #{u.name}"
			u.created_projects.each do |project|
				project.choice.destroy
				project.reports.each do |report|
					report.answers.each do |answer|
						answer.destroy
					end
				end
				project.incidents.each do |incident|
					incident.destroy
				end
			end
			u.tokens.each do |token|
				token.destroy
			end
			u.invitations.each do |invitation|
				invitation.destroy
			end
			u.subordinates.each do |subordinate|
				subordinate.destroy
			end
			u.destroy
		}
		puts 'Done'
	end
end
