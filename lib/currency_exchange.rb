module CurrencyExchange
  require 'json'
  data_file = File.read('data/eurofxref-hist-90d.json')
  @currencies_hash = JSON.parse(data_file)
  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate

    if from_currency == "EUR"
      return @currencies_hash[date.to_s][to_currency]

    elsif to_currency == "EUR"
      return 1 / @currencies_hash[date.to_s][from_currency]

    else
      return @currencies_hash[date.to_s][to_currency] / @currencies_hash[date.to_s][from_currency]
    end
  end

end
