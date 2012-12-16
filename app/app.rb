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

      red = Apis::RedditApi.new
      twi = Apis::TwitterApi.new
      red_res = red.do_search(term)
      twi_res = twi.do_search(term)
      new_res = { "results" => red_res["results"].concat(twi_res["results"]) }
      Yajl.dump new_res
    end
  end
end


