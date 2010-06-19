# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def display_messages
    div="<div id='messages'>"
      if session[:success]
       div << "<p class='success'>"+session[:success]+"</p>"
       session[ :success ] = nil
      end
      if session[:info]
       div << "<p class='info'>"+session[:info]+"</p>"
       session[ :info ] = nil 
      end
      if session[:notice]
       div << "<p class='notice'>"+session[:notice]+"</p>"
       session[ :notice ] = nil 
      end
      if session[:error]
       div << "<p class='error'>"+session[:error]+"</p>"
       session[ :error ] = nil
      end
      if session[:warning]
      div << "<p class='warning'>"+session[:warning]+"</p>"
      end
     session[ :warning ] = session[ :error ] = session[:notice] = session[:info] = session[:success] = nil
    div << "</div>"
  end

def wrap(txt, col = 80,deli=',')
  txt.gsub!(/(.{1,#{col}})(#{deli}+|$)\n?|(.{#{col}})/,
    "\\1#{deli}\\3\n")
  txt[0..-3]
end
  
end
