class PagesController <ApplicationController

def index


  quote1 = Quote.new
  quote1.text = "Failure is not an option. Everyone has to succeed"
  quote1.author = "Arnold Schwarzenegger"

  quote2 = Quote.new
  quote2.text = "You're time is limited, so don't waster it living someone else's life"
  quote2.author = "Steve Jobs"

  quote3 = Quote.new
  quote3.text = "Better Ingerdients, Better Pizza"
  quote3.author = "Papa John"
  
  @quotes =[quote1, quote2, quote3]

end
def about
end

end
