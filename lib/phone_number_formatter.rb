class PhoneNumberFormatter
  PHONE = %r{
    (?<country_code>\+\d+)?
    .*?
    (?<area_code>\d{3})
    .*?
    (?<exchange>\d{3})
    .*?
    (?<subscriber>\d{4})
  }x

  BAD_PHONE = /\A(\d{3})\s(\d{3})\s(\d{3})\z/

  def initialize(number)
    @number = number
  end

  def format_number
    return @number if number_is_wrong?

    @number = @number.match(PHONE)

    "#{country_code}#{area_code}#{exchange}#{subscriber}"
  end

  private

  def number_is_wrong?
    @number.match(BAD_PHONE)
  end

  def country_code
    return "" unless @number[:country_code]

    "#{@number[:country_code]} "
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
