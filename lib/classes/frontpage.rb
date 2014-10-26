class Frontpage

  attr_accessor :available_months

  def initialize
    self.available_months = [
        'July',
        'December',
        'July (next year)',
        'December (next year)',
        'July (two years from now)',
        'December (two years from now)'
    ]
  end

  def find_basic_content
    assert $browser.h2(text: 'Welcome to MarsAir!').exists?, "Headline not found"
    assert $browser.h3(text: 'Book a ticket to the red planet now!').exists?, "Subtitle not found"
    assert $browser.label(text: 'Departing').exists?, "Depart Label not found"
    assert $browser.label(text: 'Returning').exists?, "Return Label not found"
    assert $browser.input(value: 'Search').exists?, "Search Button not found"
    assert !($browser.text.include? '500'), "500 error detected"
  end

  def find_departure_and_return_field
    assert list('departing').exists?, "Departure dropdown not found"
    assert list('returning').exists?, "Return dropdown not found"
  end

  def values_should_be_december_and_july
    available_months.each do |month|
      assert (list('departing').text.include? month), "Month #{month} not found in departing select list"
      assert (list('returning').text.include? month), "Month #{month} not found in returning select list"
    end
  end

  def find_voucher_field
    assert $browser.label(text: 'Promotional Code').exists?
    assert $browser.input(id: 'promotional_code').exists?
  end

  private

  def list(id)
    $browser.select_list(id: id)
  end

end