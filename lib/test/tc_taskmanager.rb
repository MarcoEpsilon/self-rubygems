$:.unshift File.join(File.dirname(__FILE__), "..", '..', "lib")
require 'test/unit'
require 'avertasks/taskmanager.rb'
class Use < Test::Unit::TestCase
    def fibonacci(n)
        if n == 1 || n == 2 then
            return 1
        end
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
    def test_taskmanager()
        taskmanager = TaskManager.new
        10.upto(22) do |index|
            taskmanager.add_task(index) { |index| puts fibonacci(index) }
        end
        taskmanager.join()
        assert(TaskQueue.run_times == 13, 'some thread loss ...')
    end
end