require 'guard/compat/plugin'
require 'guard/pytest/version'

module Guard
  class Pytest < Plugin
    def initialize(options = {})
      super
    end

    def start
    end

    def stop
    end

    def reload
    end

    def run_all
      $stdout.puts `py.test #{options[:pytest_option]}`
      true
    end

    def run_on_modifications(paths)
      $stdout.puts `py.test #{options[:pytest_option]} #{paths.join ' '}`
      true
    end

  end
end
