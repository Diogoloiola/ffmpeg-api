module OsServices
  class System
    def windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def unix?
      !windows?
    end

    def linux?
      unix? and !mac?
    end

    def jruby?
      RUBY_ENGINE == 'jruby'
    end

    def fetch_current_user
      `echo $USER`.chomp
    end
  end
end
