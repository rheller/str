module ThingsHelper

    def user_owns_thing?(thing)      
      logged_in? && thing.user_id == current_user.id
    end

    def ok_to_show?(thing)      
#deprecated because I'm handling it in the model
      return true
    end

  def ok_to_delete?(thing)      
    #can't delete if not owner
      if !(user_owns_thing?(thing) )
        return false
      end
  return true
  end


def no_things(things)
   content_tag('li', "No Things") if things.empty?
 end


  def suggestions_for_select()
         [ 
            ["Category" , "category"], 
            ["Acquired" , "acquired"], 
            ["Title" , "title"]
          ]
  end
end
