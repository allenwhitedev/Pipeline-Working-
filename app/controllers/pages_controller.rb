class PagesController < ApplicationController
  def home
  end

  def help
  end

  def calendar
    @time = Time.zone.now
    @month = params['month'].to_i
    @year = params['year'].to_i
    #stuff like this can be put in model/helpers(fat model, skinny controller)
    #can these be symbols instead? That would match rest of app better(insignificant)
    if @month > 0 && @month < 13
    elsif @month > 0
      @month = 1
      @year += 1
    else
      @month = 12
      @year -= 1
    end  
  end

  def fb_login
  end

  def help
  end

  def pipeline
  end

  def events
    if signed_in?
    @event = current_user.events.build #maybe signed_in_mod as well or instead
    @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end



