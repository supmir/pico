require 'uri'
class ShortenedLinksController < ApplicationController
  def show
    @shortened_link = ShortenedLink.find_by_path(params[:path])
    if @shortened_link
      redirect_to @shortened_link.link.href, allow_other_host:true
    else
      redirect_to "/"
    end
  end

  def new
    @shortened_link = ShortenedLink.new
  end

  def create
    @href = params[:shortened_link][:href]
    if !(@href =~ /^https?:\/\//)
      @href = 'http://' + @href
    end
    @link = Link.find_by_href(@href)
    if !@link
      @link = Link.create_new_using_href(@href)
      if !@link.save
        render :new, status: :unprocessable_entity
      end
    end
    loop do
      @path = helpers.generate_new_name
      shortened_link = ShortenedLink.find_by_path(@path)
      if !@shortened_link
        break
      end
    end
    @shortened_link = ShortenedLink.new(
        path:@path,
        link:@link
    )
    if !@shortened_link.save
      render :new, status: :unprocessable_entity
    end
  end
end
