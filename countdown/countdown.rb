#http://codingkata.org/katas/unit/nasa-countdown
class Countdown
  def countdown(num)
    return [0] if num == 0    
    return [num] + countdown(num-1)
  end
end

start_num = ARGV[0].to_i
p (0..start_num).to_a.reverse, Countdown.new.countdown(start_num)
puts (0..start_num).to_a.reverse  ==  Countdown.new.countdown(start_num)