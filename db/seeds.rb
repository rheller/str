# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)



	rick=User.create(
             :login=>"rheller",
             :email=>"rick.heller@yahoo.com",
			 		   :password=>"rickheller",
			 		   :password_confirmation=>"rickheller",
             :reminder_interval => 2,
             :suspend_email => false,
			 		   )
             
puts rick.login 
puts rick.last_reminder
puts rick.activation_code
  
	cindy=User.create(
             :login=>"clevine",
             :email=>"clevine@bidmc.harvard.edu",
			 		   :password=>"rickheller",
			 		   :password_confirmation=>"rickheller",
             :reminder_interval => 3,
             :suspend_email => false,
			 		   )


