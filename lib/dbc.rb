class DBC 
  def self.require(condition, message = "")
    unless condition
      error('Pre', message, caller)
    end
  end

  def self.require_not_blank(string, message = "")
    if string.strip.blank?
      error('Pre', message, caller)
    end
  end

  def self.assert(condition, message = "")
    unless condition
      error('Assert', message, caller)
    end
  end

  def self.ensure(condition, message = "")
    unless condition
      error('Post', message, caller)
    end
  end
  
  def self.fail(message = "")
    error('Fail', message, caller)
  end
  
  private 
  
  def self.error(type, message, caller)
    raise RuntimeError.new("#{type}-condition failed: #{message}\nTrace was: #{caller.join("\n")}")
  end
end