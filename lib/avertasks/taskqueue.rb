require File.join(File.dirname(__FILE__), 'task.rb')
class TaskQueue
    attr_reader :tasks
    attr_reader :id
    attr_reader :completed
    attr_reader :runing
    attr_reader :waiting
    attr_accessor :full_count
    attr_accessor :cankill
    alias :waiting? :waiting
    alias :runing? :runing
    class ArgumentErr < StandardError
    end
    class TaskRunErr < StandardError
    end
    @@errMsg = [
        'ArgumentErr for func:{func} argument type: {type} is requirement'
    ]
    @@run_times = 0
    def initialize(id, full_count)
        # define for collect tasks
        @tasks = []
        @id = id
        @completed = 0
        @runing = false
        @waiting = true
        @task_mutex = Mutex.new
        @full_count = full_count
        @cankill = false
        @alldo = false
    end
    def push(task)
        raise ArgumentErr.new(TaskQueue.errMsg[0].sub(/{func}/, 'TaskQueue.push').sub(/{type}/, 'Task')) unless task.instance_of? Task
        @task_mutex.synchronize { @tasks << task }
        self
    end
    # @waiting,@runing now is useless...
    def run()
        @task_mutex.synchronize do
            if @tasks.none? then
                @waiting = true
                @runing = false
                @alldo = true
                return false
            else
                @waiting = false
                @runing = true
                @alldo = false
                # temp variable for this func
                @current_task = @tasks.pop
            end
        end
        # note that i have drop out the result of your proc
        @current_task.run if @current_task
        @completed += 1
        @@run_times += 1
        return true
    end
    def hungry?()
        count = 0
        @task_mutex.synchronize do
            count = full_count - @tasks.size
        end
        return 0 if count <= 0
        return count
    end
    def none?
        @task_mutex.synchronize do
            @tasks.none?    
        end
    end
    def start()
        thr = Thread.new do
            while (!cankill || !@alldo) do
                Thread.pass unless self.run
            end
        end
        return thr
    end
    class << self
        def run_times()
            return @@run_times
        end
    end
end