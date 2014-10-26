class PromotionCode

  attr_accessor :code, :valid, :size_checksum, :discount

  def initialize(params)
    self.valid = params[:valid]
    self.size_checksum = params[:checksum]
    d1 = digit
    d2 = digit
    d3 = digit
    checksum = calculate_checksum(d1, d2, d3)
    self.code = "#{Random.alphanumeric(2)}#{d1}-#{Random.alphanumeric(3)}-#{d2}#{d3}#{checksum}"
    self.discount = ( d1 * 10 )
  end

  def find_sorry_message
    assert_voucher_displayed
    ['Sorry, code', 'is not valid'].each do |text|
      assert_text_displayed(text)
    end
  end

  def find_correct_discount
    assert_voucher_displayed
    ['Promotional code', 'used:'].each do |text|
      assert_text_displayed(text)
    end
    assert $browser.strong(text: "#{discount}% discount").exists?, "did not find #{discount}% discount on result page"
  end

  private

  def assert_voucher_displayed
    assert $browser.element(text: code).exists?, "promotion code '#{code}' not found on result page"
  end

  def assert_text_displayed(text)
    assert ($browser.p(class: 'promo_code').text.include? text), "text '#{text}' not found on result page"
  end

  def digit
    case size_checksum
      when 'low'
        [1, 2, 3].sample
      when 'high'
        [4, 5, 6, 7, 8, 9].sample
    end
  end

  def calculate_checksum(d1, d2, d3)
    case valid
      when true
        sum = d1 + d2 + d3
      when false
        sum = d1 + d2 + d3 - 1
      else
        raise "'valid' must be to true or false"
    end
    sum.to_s.split('').last
  end

end