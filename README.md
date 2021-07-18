# FreeAgent Coding Challenge
*Disclaimer: This was my first time using Ruby!*

## The Brief

* Your solution should be written in Ruby
* We want to know what the exchange rate is between two currencies on a given date.
* In the future we will want to switch between different sources of foreign exchange rates and we would like you to design your solution with this in mind. Other sources might not be JSON and may not be based on the EUR.
* The method definition should not be changed.
* This method must return the exchange rate between `from_currency` and `to_currency` on `date` as a float.
* If the method is unable to calculate the exchange rate requested, it should raise an exception.
* If there is no rate for the date provided, it should raise an exception.

## Solution Setup and Run Instructions

No additional setup required.

## Design Decisions

I used a TTD approach which enabled me to refactor my code with confidence along the way.

I parsed the JSON data into a hash to allow for easy iteration through the values to find corresponding rates for each currency.

For the exchange calculator I broke down the problem into 4 potential (successful) scenarios:
* The 'to' and 'from' currencies were the same
* The 'to' currency was the base currency
* The 'from' currency was the base currency
* Neither the 'to' nor the 'from' currencies were the base currency

After getting the calculator working I refactored my code using the variables `to_rate` and `from_rate`, to make the code DRY.

My test suite echoes these 4 successful scenarios in the calculator, testing for each one separately. I added a further test to ensure that the result is returned as a float. The final tests are focused on error handling and check for the correct exceptions being raised depending on the reason for error.

At the start of the CurrencyExchange.rate method the base currency, data type and data source have been declared - these could be amended if needed for a different data source.

## Room for Improvement

Given more time I would improve my solution by isolating the concerns of different parts of my code into their own modules: One for data validation, and one for error handling. This would allow these elements of my code to be tested separately.

The data validation module would handle the data format and source. This would make it easier to interchange different data sources in future, for example from a database or a live API feed.

I would use an error handling module to create custom error classes, to provide targeted help to the user when each exception is raised. These error classes could then be reused across the codebase if the project needed to scale up in future.