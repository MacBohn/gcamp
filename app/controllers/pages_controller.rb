class PagesController < PublicController

  def index
    quote1 = Quote.new
    quote1.text = "Failure is not an option. Everyone has to succeed"
    quote1.author = "Arnold Schwarzenegger"

    quote2 = Quote.new
    quote2.text = "You're time is limited, so don't waste it living someone else's life"
    quote2.author = "Steve Jobs"

    quote3 = Quote.new
    quote3.text = "Better Ingerdients, Better Pizza"
    quote3.author = "Papa John"

    @quotes = [quote1, quote2, quote3]


  end
  def about
    @projects = Project.all.count
    @tasks = Task.all.count
    @memberships = Membership.all.count
    @users = User.all.count
    @comments = Comment.all.count
  end
  def tasks

  end

  def faq
    faq1 = Faq.new
    faq1.question = "What is gCamp?"
    faq1.answer = "gCamp os an awesome tool that will change your life.gCamp
    is your one stop shop to organize all of your tasks and documents.
    You'll also be able to track comments that you and others make.
    gCamp may eventually replace all your need for paper and pen in the
    entire world. Well, maybe not, but its going to be really cool."

    faq2 = Faq.new
    faq2.question = "How do I join gCamp?"
    faq2.answer = "Right now, gCamp is still in production. So, there is not a sign up
    page open to the public, yet! Your best option is to become super bestfriends
    with a gCamp developer. They can be found hanging around gSchool in the day
    and hitting the hottest clubs at night."

    faq3 = Faq.new
    faq3.question = "When will gCamp be finished?"
    faq3.answer = "gCamp is a work in progress. That being said, its should be fully
    functional by December 2014. Functional, but our developers are going
    to continue to improve the site for foreseeable future. Check in daily
    for new features and awesome functionality It's going to blow your mind.
      Organization is only(well,will only) be a click away. Amazing!"

      @faqs = [faq1, faq2, faq3]
    end
  end
