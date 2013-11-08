module ReddGex
  class App < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))

    set :public_folder, "#{dir}/frontend/public"
    set :static, true

    get '/' do
      haml :index
    end

    get '/search/:q' do
      term = params[:q]

      content_type :json

      results = { "results" => [] }

      apis = [Apis::RedditApi.new, Apis::TwitterApi.new(TwitterConfig.new)]

      threads = []

      apis.each { |api|
        threads.push(
            Thread.new do
              results["results"].concat(api.do_search(term)["results"])
            end
        )
      }

      threads.each { |t| t.join }

      Yajl.dump results
    end
  end
end


