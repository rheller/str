class ThingsController < ApplicationController
 require 'csv'

before_filter :check_if_logged_in

def index
    @user = User.find_by_id(current_user.id)
      if @user && @user.ok_to_see?(logged_in?, current_user) 
      unsorted_things = Thing.find_all_by_user_id(@user.id)

#note the ampersand in front of the literal
      @things = unsorted_things.sort_by(&:title)      
    else
         redirect_to :controller => 'explanations', :action => 'index'
  end
end

  def category
      @category = params[:category]
      @things = Thing.find(:all, :conditions => ["user_id = ? AND category = ?", current_user.id, @category])
  end



  def new
  #create a new empty object, in case need to retain for validation
       @thing = Thing.new
  #default the random_reminder to checked     
       @thing.remind_random = true;
  end

  def create
@thing = Thing.new(params[:thing])

#logger.info "rocko   "   

#save creator id
  if current_user
    @thing.user_id = current_user.id
  end
  
  if @thing.save
     flash[:notice] = 'Thing created successfully'
     redirect_to :action => 'show', :id => @thing.id
  else
       render :action => "new"
  end


  end

  def edit
    find_thing
  end

  def show
    find_thing
  end

  def destroy
    ##need to check if ok to access.
    find_thing
    #user_id = @thing.user.id

    @thing.destroy
    flash[:notice] = 'Thing deleted.'
    redirect_to :action => "index", :id => current_user.id
  end

  def update
    find_thing
    if @thing.update_attributes(params[:thing])
         flash[:notice] = 'Thing updated succcessfully'
         redirect_to :action => 'show', :id => params[:id]
    else
         render :action => "edit"
    end
  end

 

  def import
  end

  def csv_update 
     @parsed_file=CSV::Reader.parse(params[:dump][:file])
     n=0
     @parsed_file.each  do |row|
     c=Thing.new
     get_from_row(c, row)
     if c.save
        n=n+1
        #GC is garbage collection.
        GC.start if n%50==0
     end
     flash[:notice] ="CSV Import Successful,  #{n} new records added to data base"
   end
    redirect_to :action => "index", :id => current_user.id
 end



  def export
    #opened with user_id, makes it unique
   temp_filename ="#{RAILS_ROOT}/tmp/downloads/" + current_user.id.to_s + ".csv"   
# row needs to be initialized or else rails gets confused
   row = []
   CSV.open(temp_filename, "wb") do |csv|
     @user = User.find_by_id(current_user.id)
     if @user && @user.ok_to_see?(logged_in?, current_user) 
      unsorted_things = Thing.find_all_by_user_id(@user.id)
      for thing in unsorted_things do  
         put_in_row(thing, row)
         csv << row
      end
    end
   end

#these needs to be outside the csv loop or it doesn't fully close and it sends a blank file
     send_file_options = {        :type => "text/xml", :filename => "things.csv"  }
     send_file(temp_filename, send_file_options)
 #would like deleted for privacy reasons, but problem is that the send_file is a separate thread    
#     File.delete(temp_filename)
 end


def report
end
def print_report
    @user = User.find_by_id(current_user.id)
      if @user && @user.ok_to_see?(logged_in?, current_user) 
      unsorted_things = Thing.find_all_by_user_id(@user.id)
  #note the ampersand in front of the literal
#lame case. How to make more elegant?
       sort_ord = params[:dump][:sort_order].to_s
       
       logger.debug sort_ord
       case    
         when sort_ord == "acquired"
           logger.debug "\n\nits aquisition"
          @things = unsorted_things.sort_by(&:acquired) 
        when sort_ord == "category"   
           logger.debug "\n\nits category"
         @things = unsorted_things.sort_by(&:category) 
        else  
           logger.debug "\n\nits title\n\n\n"
         @things = unsorted_things.sort_by(&:title) 
       end 
    else
         redirect_to :controller => 'explanations', :action => 'index'
  end
end


 def find_thing
   @thing = nil
    begin  
      thing = Thing.find(params[:id])
    rescue ActiveRecord::RecordNotFound => exc
      logger.info("No such thing exception: #{exc.message}")
#redirect doesn't seem to work inside rescue block
    end
     logger.info("\n thing user is " + thing.user_id.to_s)
     if thing && thing.user.ok_to_see?(logged_in?,current_user)
        @thing = thing
    else
      logger.info("***thing unavailable")
      flash[:notice] = "thing unavailable"
      redirect_to :controller => 'explanations', :action => 'index'
    end
end

private

def get_from_row(thing, row)
     thing.user_id =current_user.id
     
     thing.title                 =row[0]
     thing.category          =row[1]
     thing.description       =row[2]
     thing.price               =row[3]
     thing.brand              =row[4]
     thing.model              =row[5]
     thing.purchased_from =row[6]
     thing.loaned_to             =row[7]
     thing.acquired           =row[8]
     thing.remind_on         =row[9]
     thing.remind_random   =row[10]

end

def put_in_row(thing, row)

         row[0] = thing.title
         row[1] = thing.category
         row[2] = thing.description
         row[3] = thing.price 
         row[4] = thing.brand
         row[5] = thing.model
         row[6] = thing.purchased_from
         row[7] = thing.loaned_to
         row[8] = thing.acquired
         row[9] = thing.remind_on       
        row[10] = thing.remind_random

end


private

def check_if_logged_in
  if !logged_in? 
      redirect_to '/login'
  end
end


end