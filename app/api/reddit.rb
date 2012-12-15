require 'uri'

module Apis
  class RedditApi
    include HTTParty

    base_uri "reddit.com"

    def self.do_search(term)
      result = get("/search.json?q=#{URI.encode(term)}&sort=top")
      sanitized = { "results" => [] }
      result['data']['children'].each { |i|
        sanitized['results'].push({ "title" => i['data']['title'], "permalink" => i['data']['permalink']})
      }
      return sanitized
    end
  end
end
