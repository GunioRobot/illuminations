class FailTimeout
  class Counter
    attr :original_count
    attr_accessor :count
    def initialize(count=1); @original_count = count; @count = count; end
    def decrement; @count -= 1; end
    def done?; @count <= 0; end
    def reset; @count = 0; end
    def restart; @count = @original_count; end
  end
  
  def self.silently(timeout=30, more_times=0)
    counter = FailTimeout::Counter.new(more_times)
    begin
      SystemTimer.timeout(timeout) { yield counter }
    rescue Timeout::Error
      unless counter.done?
        counter.decrement
        retry
      end
    rescue
      raise $!
    end # begin...rescue...rescue
  end # self.silenty
  
  def self.twice(timeout=30)
    self.silently(timeout, 1) { |counter| yield counter }
  end
end