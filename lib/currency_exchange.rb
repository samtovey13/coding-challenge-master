module CurrencyExchange
  
  def self.rate(date, from_currency, to_currency)

    # Set base currency and data type/source
    @base_currency = "EUR"
    data_type = "JSON"
    data_source = File.read('data/eurofxref-hist-90d.json')

    # Potential to add parsing instructions for different data types in future if not JSON
    case data_type
    when "JSON"
      require 'json'
      @currencies_hash = JSON.parse(data_source)
    end

    # Raises an exception if the data does not exist
    raise StandardError, "Data not in valid format" unless @currencies_hash
    # Raises an exception if there is no rate for the date provided.
    raise StandardError, "No information for this date" unless @currencies_hash[date.to_s]

    # Return the exchange rate between from_currency and to_currency on date as a float.
    to_rate = @currencies_hash[date.to_s][to_currency]
    from_rate = @currencies_hash[date.to_s][from_currency]

    if from_currency == @base_currency && to_rate
      to_rate
    elsif to_currency == @base_currency && from_rate
      1 / from_rate
    elsif to_rate && from_rate
      to_rate / from_rate
    else
      # Raises an exception if unable to calculate requested rate.
      raise StandardError, "Missing rate: Unable to calculate"
    end
  end
end
