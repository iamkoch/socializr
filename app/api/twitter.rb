require 'api/searchable'
require 'domain/twitter_config'
require 'grackle'

module Apis
  class TwitterApi < Searchable
    include HTTParty

    base_uri 'search.twitter.com'

    def initialize(config)
      @config = config
    end

    def get_search_string(term)
      "/search.json?q=#{URI.encode(term)}&rpp=5"
    end

    def do_search(term)
      client = Grackle::Client.new(:auth=>{
        :type => :oauth,
        :consumer_key => @config.consumer_key, :consumer_secret => @config.consumer_secret,
        :token => @config.token, :token_secret => @config.token_secret
      })

      results = client.search.tweets?(:q => term)
      sanitize_results results
    end

    def sanitize_results(result)
      sanitized = { 'results' => [] }
      result.statuses.each { |i|
        sanitized['results'].push({
                                    'type' => 'twitter',
                                    'title' => i.text,
                                    'permalink' => "http://twitter.com/statuses/#{i.id_str}"
                                  })
      }
      sanitized
    end
  end
end