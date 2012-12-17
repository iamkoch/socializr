require 'api/searchable'

module Apis
  class TwitterApi < Searchable
    include HTTParty

    base_uri "search.twitter.com"

    def get_search_string(term)
      "/search.json?q=#{URI.encode(term)}&rpp=5"
    end

    def sanitize_results(result)
      sanitized = { "results" => [] }
      result['results'].each { |i|
        sanitized['results'].push({
                                    "type" => "twitter",
                                    "title" => i['text'],
                                    "permalink" => "http://twitter.com/statuses/#{i['id_str']}"
                                  })
      }
      sanitized
    end
  end
end