class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @journey_status = false
  end

  def top_up(amount)
    if (@balance + amount) > MAXIMUM_BALANCE
      fail "Max. balance #{MAXIMUM_BALANCE} exceeded"
    end
    @balance += amount
  end

  def in_journey?
    @journey_status
  end

  def touch_in
    if @balance < MINIMUM_BALANCE
      fail "Insufficient balance. Min. balance is #{MINIMUM_BALANCE}"
    end
    @journey_status = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @journey_status = false
  end
end

private

def deduct(amount)
  @balance -= amount
end
