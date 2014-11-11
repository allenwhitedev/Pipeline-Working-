module EventsHelper
  require 'date'

  def show_events_for_user(user)
    events_list = ""
    user.ou_rels.each do |ou_rel|
      organization = Organization.find(ou_rel.joined_id)
      events_list += show_events_for_org(organization)  
    end  
    events_list
  end

  def show_events_for_org(organization)
    org_events = ""
    organization.reverse_oe_rels.each do |reverse_oe_rel|
      event = Event.find(reverse_oe_rel.attender_id)
      org_events += "<h2>#{event.title}<h2><br>"
    end
    org_events
  end


 

    #see if you can make this private
  def generate_checkincode
      sai_words = %w(sisters chapter formal music business sigma alpha iota)
      sai_words[rand(sai_words.length)]+(rand(89)+10).to_s()
  end

  def wrap(comment)
    sanitize(raw(comment.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event Created"
      redirect_to events_url
    else
      @feed_items = []
      render 'pages/events'
    end
  end

  private

    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text :
                                  text.scan(regex).join(zero_width_space)
    end
end