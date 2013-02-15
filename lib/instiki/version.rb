module Instiki
  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 19
    TINY  = 6
    SUFFIX = '(MML+)'
    PRERELEASE = false
    if PRERELEASE
      STRING = [MAJOR, MINOR].join('.') + PRERELEASE
    else
      STRING = [MAJOR, MINOR, TINY].join('.')
    end
  end
end