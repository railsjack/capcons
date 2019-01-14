task :GEN_REPORT =>:environment do
	@projects = Project.all

	@projects && @projects.each do |project|
		reports = project.reports
		reports && reports.each do |report|
			if report.answers.where(status: [1,2,3]).present?
				report.update(submit: Date.today)
				new_report = project.reports.build
				new_report.name = "#{project.name} Report #{Date.today.to_s}"
				new_report.user_id = report.user_id
				new_report.save!
				Question.all.each do |q|
			      new_report.answers.create!(question_id: q.id)
			    end
			else
				puts "report dosn't generate"
			end
		end
	end
end
# Project.first.reports.last.answers.where(status: [1,2,3])
