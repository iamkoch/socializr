class Searchable
  include HTTParty

  ERROR_SEARCH_NOT_OVERRIDDEN = 'ERROR: Search string not overridden!'

  def sanitize_results(result)
    result
  end

  def do_search(term)
    result = self.class.get(get_search_string(term))

    sanitize_results(result)
  end

  def get_search_string(term)
    raise ERROR_SEARCH_NOT_OVERRIDDEN
  end

  protected :get_search_string
  protected :sanitize_results
end