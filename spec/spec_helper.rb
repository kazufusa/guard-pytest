$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'guard/pytest'
require "guard/compat/test/helper"

def include?(expected)
  satisfy do |string|
    string.include? expected
  end
end

