class LogLineParser
  attr_accessor :line
  
  def initialize(line)
    @line = line
  end

  def message
    @message ||= line.gsub(/(\[(INFO|WARNING|ERROR)\]:\s)/, "").strip
  end

  def log_level
    @log_level ||= line.match(/INFO|WARNING|ERROR/)[0].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
