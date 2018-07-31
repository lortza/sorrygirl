module ApplicationHelper
 def page_title
   if content_for?(:title)
     "Sorry Girl - #{content_for(:title)}"
    else
     "Sorry Girl - The Apology You Needed to Hear, but from Ryan Gosling"
   end
 end

 def page_description
   if content_for?(:description)
     "Sorry Girl - #{content_for(:description)}"
   else
     page_title
   end
 end
end #ApplicationHelper
