require 'guard'
require 'guard/guard'

module Guard
  class Pytest < Guard
    def initialize(watchers = [], options = {})
      @option = options.map do |k, v|
        if v == true
          "#{'-'*(k.length>1? 2: 1) }#{k}" 
        elsif v.is_a? String
          "#{'-'*(k.length>1? 2: 1) }#{k}=#{v}"
        end
      end.join ' '

      super
    end

    def run_all
      system "py.test #{@option}"
    end

    def run_on_change(paths)
      grouped_paths = paths.group_by{|path| File.exist? path}

      system "py.test #{@option} #{grouped_paths[true].join ' '}" if grouped_paths[true]
    end

  end
end
