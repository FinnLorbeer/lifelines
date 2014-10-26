class InvalidReturnDates < Test::Unit::TestCase

  attr_accessor :headline_text, :logo_text

  def setup
    Setup.new
  end

  def teardown
    Teardown.new
  end

  def test_invalid_return_dates
    store_method_name
    search = Searchparameter.new
    [
      ['July', 'December'],
      ['July (next year)', 'December (next year)'],
      ['July (two years from now)', 'December (two years from now)'],
      ['December', 'July (next year)'],
      ['December (next year)', 'July (two years from now)']
    ].each do |array|
      search.enter_params depart: array[0], return: array[1]
      search.find_invalid_dates
    end
    search.enter_params depart: 'July', return: 'December (two years from now)'
    search.find_valid_dates
  end

end
