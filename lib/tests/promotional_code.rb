class BasicSearchFlow < Test::Unit::TestCase

  def setup
    Setup.new
  end

  def teardown
    Teardown.new
  end

  def test_voucher_frontpage_field
    store_method_name
    Frontpage.new.find_voucher_field
  end

  def test_voucher_invalid_code_low_checksum
    store_method_name
    promotion = PromotionCode.new valid: false, checksum: 'low'
    search_with_successfull_result promotion.code
    promotion.find_sorry_message
  end

  def test_voucher_invalid_code_high_checksum
    store_method_name
    promotion = PromotionCode.new valid: false, checksum: 'high'
    search_with_successfull_result promotion.code
    promotion.find_sorry_message
  end

  def test_voucher_valid_code_low_checksum
    store_method_name
    promotion = PromotionCode.new valid: true, checksum: 'low'
    search_with_successfull_result promotion.code
    promotion.find_correct_discount
  end

  def test_voucher_valid_code_high_checksum
    store_method_name
    promotion = PromotionCode.new valid: true, checksum: 'high'
    search_with_successfull_result promotion.code
    promotion.find_correct_discount
  end

  def test_voucher_cross_side_scripting
    store_method_name
    search_with_successfull_result "</tt><p class=\"xss\" style=\"background-color:pink;\">XSS successfull</p><tt>"
    assert !$browser.p(class: 'xss').exists?, "cross side scripting is unfortunatley working"
  end

  private

  def search_with_successfull_result(promo_code)
    search = Searchparameter.new
    $browser.text_field(id: 'promotional_code').set promo_code
    search.enter_params depart: 'July', return: 'December (two years from now)'
  end

end