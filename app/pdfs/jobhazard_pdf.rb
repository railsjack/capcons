class JobhazardPdf < Prawn::Document
  require 'prawn/table'
  def initialize(jobhazard)
    super(top_margin: 20)
    @jobhazard = jobhazard
    jobhazard_heading
    jobhazard_details
    
  end

  def jobhazard_heading
    text  "<u>Detailed View of your new job hazard analysis</u>", size: 25, style: :bold, align: :center, inline_format: true
  end
  
  def jobhazard_details
    move_down 30
    data = 
      [
        [ "Date",     @jobhazard.created_at.strftime('%m/%d/%Y') || "N/A" ],
        [ "Scope of work to be performed",     @jobhazard.sow || "N/A" ],
        [ "What are the critical steps?",       @jobhazard.criticalsteps || "N/A" ], 
        [ "What are the error likely situations?",       @jobhazard.situations || "N/A" ],
        [ "What is the worst that can happen?",     @jobhazard.worsthappen || "N/A" ],
        [ "What defenses are in place?",     @jobhazard.defenses || "N/A" ]
         
      ]
    table(data, cell_style: {border_width: 0}) do
      columns(0).font_style = :bold
    end
     
  end
  
  def convert_boolean_to_str(val)
    if val.present?
      "Yes"
    else
      "No"  
    end
  end

end