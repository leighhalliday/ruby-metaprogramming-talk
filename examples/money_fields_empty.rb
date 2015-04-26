module MoneyFields
  def money_fields(*fields)
    # read cents
    # write cents

    # read dollars
    # write dollars
  end
end

class Purchase
  extend MoneyFields
  money_fields :price
end

#### Tests

require 'minitest/autorun'

class PurchaseTest < MiniTest::Test
  attr_reader :purchase

  def setup
    @purchase = Purchase.new
  end

  def test_reading_writing_cents
    purchase.price_cents = 500
    assert_equal purchase.price_cents, 500
  end

  def test_reading_writing_dollars
    purchase.price = 5.00
    assert_equal purchase.price, 5.00
  end

  def test_converting_to_dollars
    purchase.price_cents = 500
    assert_equal purchase.price, 5.00
  end

  def test_converting_to_cents
    purchase.price = 5.00
    assert_equal purchase.price_cents, 500
  end

  def test_writing_dollars_from_string
    purchase.price = "5.00"
    assert_equal purchase.price_cents, 500
  end

  def test_writing_cents_from_string
    purchase.price_cents = "500"
    assert_equal purchase.price_cents, 500
  end

  def test_nils
    purchase.price = nil
    assert_equal purchase.price, nil
  end

  def test_creating_methods
    assert_equal Purchase.instance_methods(false), [:price_cents, :price_cents=, :price, :price=]
  end

  def test_respond_to_dollars
    assert_equal purchase.respond_to?(:price), true
    assert_equal purchase.respond_to?(:price=), true
  end

  def test_respond_to_cents
    assert_equal purchase.respond_to?(:price_cents), true
    assert_equal purchase.respond_to?(:price_cents=), true
  end

end