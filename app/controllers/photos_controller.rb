class PhotosController < ApplicationController
  include HTTParty
  
  def index
    # add this as an ENV variable
    key = ENV["API_KEY"]
    url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=#{key}&content_type=1&tags=hawaiianfood&privacy_filter=1&page=1&per_page=500"
    response = HTTParty.get(url)
    results = JSON.parse(response.body)
    # @titles = @results["photos"]["photo"].map { |photo| photo["title"] }
    @urls = []

    # binding.pry
    results['photos']['photo'].each do |photo|
      @farm_id = photo['farm']
      @server_id = photo['server']
      @id = photo['id']
      @secret = photo['secret']

      url = "https://farm#{@farm_id}.staticflickr.com/#{@server_id}/#{@id}_#{@secret}.jpg"
      
      @urls << url
    end

    @urls
    render :index
    # manipulate JSON into something usable
    # Likely use a Ruby class to format it
    # pass data to view with instance variable
  end
end
