json.reports do |json|
	json.array!(@reports) do |json,report|
	  json.id report.id
	  json.name report.name
	  @answers = report.answers.where(status: 2).count
	  choice = Choice.where(checklist_id: report.id).first
	    if choice.present?
			@cat_names = Category.find(choice.category_id).name
      @cat_names_es = Category.find(choice.category_id).name_es
	    else
			@cat_names = "Not selected"
      @cat_names_es = "no seleccionado"
		end
	  json.user_id @answers
	  json.catname @cat_names
    json.catname_es @cat_names_es
	end
end


json.goodreports do |json|
	json.array!(@good_report) do |json,report|
	  json.id report.id
	  json.name report.name
	end
end
