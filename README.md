# Upcase: Regular Expressions

## Tying it all Together

Exercise for the [Regular Expressions](https://thoughtbot.com/upcase/regular-expressions) course.

## Final Code

```ruby
# phone_number_formatter.rb

class PhoneNumberFormatter
  PHONE = %r{
    (?<country_code>\+\d+)?
    .*?
    (?<area_code>\d{3})
    .*?
    (?<exchange>\d{3})
    .*?
    (?<subscriber>\d{4})
  }x # Ignore spaces inside the regex.

  def initialize(number)
    @number = number
  end

  def format_number
    return @number unless @number =~ PHONE

    @number = @number.match(PHONE)

    "#{country_code}#{area_code}#{exchange}#{subscriber}"
  end

  private

  def country_code
    @number[:country_code] ? "#{@number[:country_code]} " : ""
  end

  def area_code
    "(#{@number[:area_code]}) "
  end

  def exchange
    "#{@number[:exchange]}-"
  end

  def subscriber
    @number[:subscriber]
  end
end
```

## Additional Resources

- [Back to Basics: Regular Expressions](https://robots.thoughtbot.com/back-to-basics-regular-expressions)
- [Ruby Style Guide: Regular Expressions](https://github.com/bbatsov/ruby-style-guide#regular-expressions)
