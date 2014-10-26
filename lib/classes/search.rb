class Searchparameter

  attr_accessor :search, :departing, :returning

  def initialize
    self.search = $browser.input(value: 'Search')
    self.departing = $browser.select_list(id: 'departing')
    self.returning = $browser.select_list(id: 'returning')
  end

  def enter_params(param)
    departing.select param[:depart]
    returning.select param[:return]
    search.click
    assert $browser.h2(text: 'Search Results').exists?, "Headline of search page not found"
    assert $browser.a(href: '/', text: 'MarsAir').exists?, "Logo with Home-Link not found"
  end

  def find_result(success)
    case success[:success_expected]
      when true
        assert $browser.p(text: 'Seats available!').exists?, "Line about available seats not found"
        assert $browser.p(text: 'Call now on 0800 MARSAIR to book!').exists?, "Phone number not found"
      when false
        assert $browser.p(text: 'Sorry, there are no more seats available.').exists?, "No fail message present on search page"
      else
        raise "#{success[:success_expected]} should be 'true' or 'false'"
    end
    #assert ($browser.text.include? 'Book a ticket to the red planet now!'), "Did not find text 'Book a ticket to the red planet now!'"
    $browser.a(text: 'Back').click
  end

end