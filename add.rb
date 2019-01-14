module SimpleAddState
  S0 = 0
  S1 = 1
  S2 = 2
  S3 = 3
  S4 = 4
end

class SimpleAddTuringMachine
  include SimpleAddState
  attr_accessor :state, :head, :tape
 
  # init state
  # 0110111 (1+1)
  #  ^ 
  def initialize(input)
    self.tape = input
    self.head = 1
    self.state = S0
  end

  def increment_head
    @head += 1
  end

  def decrement_head
    @head -= 1
  end

  def run
    while state != S4 do
      case state
      when S0
        if tape[head] == 0
          tape[head] = 1
          self.state = S1
        else
          increment_head
        end
      when S1
        if tape[head] == 0
          increment_head
          self.state = S2
        else
          decrement_head
        end
      when S2
        if tape[head] == 0
          increment_head
          self.state = S3
        else
          tape[head] = 0
        end
      when S3
        if tape[head] == 0
          increment_head
          self.state = S4
        else
          tape[head] = 0
        end
      end
    end
    puts tape.join
  end
end

machine = SimpleAddTuringMachine.new(ARGV[0].split('').map(&:to_i))
machine.run




