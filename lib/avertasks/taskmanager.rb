require File.join(File.dirname(__FILE__), 'task.rb')
require File.join(File.dirname(__FILE__), 'taskqueue.rb')
class TaskManager
    @@queue = []
    @@thread_lookup = Hash.new
    @@queue_mutex = Mutex.new
    @@should_sort = 10
    @@add_count = 0
    @@full_count = 1
    def initialize()
    end
    def add_task(*args, &block)
        begin
            task = Task.new(*args, &block) 
            add_to_hungry_queue(task)
        rescue => exception
            raise exception
        end
    end
    def broadcast_cankill()
        @@queue_mutex.synchronize do
            @@queue.each { |item| item.cankill = true }
        end
    end
    def join()
        self.broadcast_cankill()
        @@queue_mutex.synchronize do
            @@thread_lookup.each_value do |thr|
                thr.join
            end
        end
    end
    class << self
        def run_times()
            return TaskQueue.run_times
        end
    end
private
    def add_to_hungry_queue(task)
        @@queue_mutex.synchronize do
            @@add_count += 1
            if @@add_count > @@should_sort then
                @@queue.sort_by { |item| -item.hungry? }
                @@add_count = 0
            end
            tasks = @@queue.find do |obj| 
                if obj.hungry? == 0 then
                    false
                else
                    true
                end
            end
            unless tasks.nil? then
                tasks.push(task)
            else
                task_queue = TaskQueue.new(@@queue.size + 1, @@queue.size + 1).push(task)
                @@queue.push(task_queue)
                @@thread_lookup[task_queue.id] = task_queue.start()
                @@full_count = @@queue.size
                @@queue.each do |queue|
                    queue.full_count = @@full_count
                end
            end
        end
    end
end