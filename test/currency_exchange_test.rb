# http://test-unit.github.io/
require 'test/unit'
require 'currency_exchange'
require 'date'

class CurrencyExchangeTest < Test::Unit::TestCase
  def setup
  end
  
  def test_currency_exchange_returns_a_float
    assert_instance_of Float, CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "USD")
  end

  def test_non_base_currency_exchange_is_correct
    correct_rate = 1.2870493690602498
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "USD")
  end

  def test_to_base_currency_exchange_is_correct
    correct_rate = 0.007763975155279502
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "JPY", "EUR")
  end

  def test_from_base_currency_exchange_is_correct
    correct_rate = 128.8
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "EUR", "JPY")
  end

  # Error handling
  def test_exception_received_for_missing_date
    assert_raises StandardError do
      CurrencyExchange.rate(Date.new(2099,11,22), "JPY", "EUR")
    end
    assert_raise_message "No information for this date" do
      CurrencyExchange.rate(Date.new(2099,11,22), "JPY", "EUR")
    end
  end

  def test_exception_received_for_missing_from_currency
    assert_raises StandardError do
      CurrencyExchange.rate(Date.new(2018,11,22), "", "EUR")
    end
    assert_raise_message "Missing rate: Unable to calculate" do
      CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "")
    end
  end
end
