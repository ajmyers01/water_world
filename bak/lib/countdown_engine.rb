require 'time'
require 'pry'
class CountdownEngine
  attr_accessor :est_time, :base_time

  def initialize(task)
    @base_time = TRAINING_TIME[task.to_sym]
  end

  # Look up the base time to complete the task
  # Look at equipment and talents that would lower time.
  def estimated_time

  end

  def time_remaining

  end

  def countdown_timer
    fin = Time.now + @base_time * 60
    while Time.now < fin
      puts (fin - Time.now).round
      sleep 1
    end
  end
end
