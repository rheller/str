class ReminderMailer < ActionMailer::Base
  def reminder_email(user, planned_things, random_thing) 
    #Was getting a parse error when this hash was below, so break it out 
    bhash = {:user => user, :planned_things => planned_things, :random_thing => random_thing}

    recipients user.email 
    from "Remindful <seeingtheroses@gmail.com>" 
    subject "Reminder About Your Things" 
    sent_on Time.now 
    body bhash  
  end   
end
