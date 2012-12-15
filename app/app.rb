module ReddGex
  class App < Sinatra::Base
    get '/' do
      @content = "this is a test"
      haml :index
    end

    get '/search/:q' do
      term = params[:q]
      content_type :json
      result = Apis::RedditApi.do_search(term)
      Yajl.dump result
    end
  end
end


