class BasicSearchFlow < Test::Unit::TestCase

  def setup
    Setup.new
  end

  def teardown
    Teardown.new
  end

  def test_frontpage_elements
    store_method_name
    frontpage_elements = Frontpage.new
    frontpage_elements.find_basic_content
    frontpage_elements.find_departure_and_return_field
    frontpage_elements.values_should_be_december_and_july
  end

  def test_search_flow_free_seats
    store_method_name
    search = Searchparameter.new
    search.enter_params depart: 'July', return: 'December (two years from now)'
    search.find_result success_expected: true
  end

  def test_search_flow_no_seats
    store_method_name
    search = Searchparameter.new
    search.enter_params depart: 'July', return: 'December (next year)'
    search.find_result success_expected: false
  end

  def test_seach_flow_invalid_parameters
    store_method_name
    search = Searchparameter.new
    search.enter_params depart: 'December (two years from now)', return: 'July'
    search.find_result success_expected: false
  end

end