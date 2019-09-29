class Task
    class TaskErr < StandardError
    end
    @@errMsg = [
        'you need pass run block to initialize'
    ]
    def initialize(*args, &block)
        raise TaskErr.new(@@errMsg[0]) unless block_given?
        @task_proc = block
        @args = args
    end
    def run()
        return @task_proc.call(*@args)
    end
end