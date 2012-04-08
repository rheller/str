desc "This task is called by the Heroku cron add-on"
task :cron => :environment do




# if Time.now.hour == 0 # run at midnight

  @users = User.find(:all)
  @users.each  do |user|

   if (! user.suspend_email)
     planned_things = user.things.find_all_by_remind_on(Time.now.strftime('%Y-%m-%d'))


#check how long its been since the last randomly sent email
     days_since_last = (DateTime.now - user.last_reminder).to_i
     if (days_since_last >= user.reminder_interval)
           send_random = true
#              print "**need to send reminder because last emailed  " + (DateTime.now - user.last_reminder).to_i.to_s + "\n\n"
#              print "interval  " + user.reminder_interval.to_s + "\n\n"
     else
           send_random = false
#           print "don't spam them because last emailed  " + (DateTime.now - user.last_reminder).to_i.to_s + "\n\n"
     end


     if send_random      
        random_things  = user.things.find_all_by_remind_random(true)
        if (random_things.length > 0)
          offset = rand(random_things.length)
          random_thing =  random_things [offset]
#        print  "amount of random things is " + random_things.length.to_s + " offset is " + offset.to_s + "\n\n"
#        print "random_thing is " + random_thing.title + "\n\n"
        end
     end


   #only email if there is something to send
     if send_random || (planned_things.length > 0)
        ReminderMailer.deliver_reminder_email(user,planned_things,random_thing)

#update the last reminder date
        if user.update_attribute(:last_reminder, DateTime.now)
#           print  "updated succesffully \n\n"
        else
#           print  "updated failed \n\n"
        end

     end




   end # not suspended emails 
  end #each user
end

#debug
#      print "planned length is " + planned_things.length.to_s + "   \n\n"
#      planned_things.each  do |planned|

#         print "rick -- user " + user.login + " planned  " + planned.title + "\n\n"
#      end  
