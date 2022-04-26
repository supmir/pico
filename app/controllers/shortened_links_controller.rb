require 'uri'
class ShortenedLinksController < ApplicationController
  def show
    @shortened_link = ShortenedLink.find(params[:id])
  end


  def redirect
    @shortened_link = ShortenedLink.find_by_path(params[:path])
    if @shortened_link
      analytic = Analytic.new(
        shortened_link:@shortened_link,
        ip:request.ip
      )
      if analytic.save
        puts analytic
        redirect_to @shortened_link.link.href, allow_other_host:true
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to "/"
    end
  end

  def new
    @shortened_link = ShortenedLink.new
  end

  def create
    @href = params[:shortened_link][:href]
    begin
      @link = Link.find_or_create_new_using_href(@href)
      @shortened_link = ShortenedLink.create_shortened_link(@link)
      if @shortened_link
        redirect_to @shortened_link
      end
    rescue SocketError
      redirect_to({ 
        :action=> :error, 
        :big_message => "We can't seem to reach your link :(",
        :message => 'Did you copy the link correctly? You typed "'+params[:shortened_link][:href]+'"'
      })
      return
    rescue
      redirect_to :error
      return
    end
  end

  def analytics
    @shortened_link = ShortenedLink.find(params[:id])
    render partial: "shortened_links/analytics"
  end

  def error
    @big_message = params[:big_message] ? params[:big_message] : "Something went wrong..."
    @message = params[:message]
  end
end
