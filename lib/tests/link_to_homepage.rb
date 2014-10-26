class LinkToHomepage < Test::Unit::TestCase

  attr_accessor :headline_text, :logo_text

  def setup
    Setup.new
    self.headline_text = 'Book a ticket to the red planet now!'
    self.logo_text = 'MarsAir'
  end

  def teardown
    Teardown.new
  end

  def test_book_a_ticket_link
    store_method_name
    find_element type: 'headline', page: 'frontpage'
    search = Searchparameter.new
    search.enter_params depart: 'July', return: 'December (two years from now)'
    find_element type: 'headline', page: 'result page'
  end

  def test_logo_link
    find_element type: 'logo', page: 'frontpage'
    search = Searchparameter.new
    search.enter_params depart: 'July', return: 'December (two years from now)'
    find_element type: 'logo', page: 'result page'
  end

  private

  def find_element(selector)
    case selector[:type]
      when 'headline'
        assert text.exists?, "link #{headline_text} not found on #{selector[:page]}"
        if selector[:page] == 'result page'
          text.click
        end
      when 'logo'
        assert logo.exists?, "Logo not found on #{selector[:page]}"
        logo.click
    end
    assert ($browser.url == 'http://florbeer.marsair.tw/'), "the link did not point to the front page"
  end

  def text
    $browser.h3(text: headline_text)
  end

  def logo
    $browser.a(href: '/', text: logo_text)
  end

end
