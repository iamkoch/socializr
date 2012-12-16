require 'uri'
require 'app/api/searchable'

module Apis
  class RedditApi < Searchable

    base_uri "reddit.com"

    def get_search_string(term)
      "/search.json?q=#{URI.encode(term)}&sort=top"
    end

    def sanitize_results(result)
      sanitized = { "results" => [] }
      result['data']['children'].each { |i|
        sanitized['results'].push({
                                      "type" => "reddit",
                                      "title" => i['data']['title'],
                                      "permalink" => "http://reddit.com/#{i['data']['permalink']}"
                                  })
      }
      sanitized
    end
  end
end
