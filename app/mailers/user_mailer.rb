class UserMailer < ActionMailer::Base
  # default from: "choudharyr@gmail.com"

  FROM_EMAIL = 'cory@capitalconstructionsolutions.com'

  def invitation(email,token,baseurl)
  	@email = email
  	@token = token
  	@base_url = baseurl
    mail(:from=>FROM_EMAIL, :to => email, :subject => "invitation")
  end

  def send_incident_report(user,body,pname,cname,answer,answers_file,to)
  	@answer = answer
  	@answers_file = answers_file
  	@email = to
    @user = user
    @cname = cname
    @body = body
    @proj_name = pname
    subject = pname+ " " + "Safety issue"
  	mail(:from=>sender_email(user),:to => to, :subject => subject, :reply_to => user.email)
  end
  
  def send_incident_report_by_incident(user,incident, incidents_file,to)
    subject = "Incident"
    @user = user
    @incident = incident
    @incidents_file = incidents_file
    mail(:from=>sender_email(user),:to => to, :subject => subject, :reply_to => user.email)
  end
  
  def send_jobhazard_report(user,body,pname,cname,answer,to)
    @answer = answer
    @file = answer.file_url
    @email = to
    @user = user
    @cname = cname
    @body = body
    @proj_name = pname
    subject = pname+ " " + "Job hazard analysis report"
    mail(:from=>sender_email(user),:to => to, :subject => subject, :reply_to => user.email)
  end
  
  def send_jobhazard_report_by_jobhazard(user,jobhazard, jobhazards_file,pname,to)
    subject = "Job hazard analysis"
    @user = user
    @jobhazard = jobhazard
    @jobhazards_file = jobhazards_file
    @projectname = pname
    mail(:from=>sender_email(user),:to => to, :subject => subject, :reply_to => user.email)
  end

  private
    def sender_email(sender)
      address = Mail::Address.new sender.email # FROM_EMAIL # ex: "john@example.com"
      address.display_name = sender.first_name + ' ' + sender.last_name # ex: "John Doe"
# Set the From or Reply-To header to the following:
      return address.format # returns "John Doe <john@example.com>"
    end

end
