module LoggerHelper

  def dblog(level, tag, msg)
      Log.create do |log|
        log.level = level
        log.tag   = tag
        log.msg   = msg
      end
  end


end
