class IncidentPdf < Prawn::Document
  require 'prawn/table'
  def initialize(incident)
    super(top_margin: 20)
    @incident = incident
    incident_heading
    incident_details
    
  end

  def incident_heading
    text  "<u>Detailed View of your new incident</u>", size: 25, style: :bold, align: :center, inline_format: true
  end
  
  def incident_details
    move_down 30
    data = 
      [ [ "Report Type:",     @incident.report_type || "N/A" ],
        [ "Your Name:",       @incident.your_name || "N/A" ], 
        [ "Job Title:",       @incident.job_title || "N/A" ],
        [ "Injury Date:",     @incident.injury_date.strftime("%a  %d - %m - %Y") || "N/A" ],
        [ "Injury Time:",     @incident.injury_time.strftime("%I:%M %p") || "N/A" ],
        [ "Injuries Type:",   @incident.injuries_type || "N/A" ], 
        [ "Witnesses:",       @incident.witnesses || "N/A" ],
        [ "location:",        @incident.location || "N/A" ],
        [ "PPE used:",        convert_boolean_to_str(@incident.ppe_used) || "N/A"  ],
        [ "Medical Assistance Provided:", convert_boolean_to_str(@incident.medical_assistance_provided) || "N/A"  ],
        [ "Event description:",   @incident.event_discription || "N/A"],
        ["Registor incident:", @incident.created_at.strftime("%a  %d - %m - %Y   %I:%M %p") ],
         
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