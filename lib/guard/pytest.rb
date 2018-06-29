require 'guard/compat/plugin'
require 'guard/pytest/version'

require 'shellwords'

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
      opts = Shellwords.shellsplit(options[:pytest_option])
      run_tests(opts)
      true
    end

    def run_on_modifications(paths)
      opts = Shellwords.shellsplit(options[:pytest_option])
      run_tests(opts, paths)
      true
    end

    private

    def pytest_cmd
      pytest_cmd = options[:pytest_cmd] || "py.test"
    end

    def run_tests(options, files = nil)
      result = system(pytest_cmd, *options, *files)
      throw(:task_has_failed) unless result
    end
  end
end
