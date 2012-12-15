module Apis
  class RedditApi
  include HTTParty

  base_uri "reddit.com"

    def self.do_search(term)
      get("/search.json?q=#{term}")
    end
  end
end
