$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'test/unit'
require 'avertasks/task.rb'
class Use < Test::Unit::TestCase
    def test_use_task()
        begin
            task = Task.new('hello') do |arg|
                arg.capitalize
            end
            assert(task.run() == 'Hello', 'task run test failed')
        rescue => exception
            assert(false, "occur exception: #{exception.message}")
        end
    end
end