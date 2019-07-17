module Enumerable

    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
        return self
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i], i)
            i += 1
        end
        return self
    end

    def my_select
        i = 0
        result = []
        while i < self.length
            if yield(self[i])
                result << self[i]
            end
            i += 1
        end
        return result
    end

    def my_all
        i = 0
        while i < self.length
            if yield(self[i]) == false
                return false
            else
                i += 1
            end
        end
        if i == self.length
            return true
        end
    end

    def my_any
        i = 0
        while i < self.length
            if yield(self[i])
                return true
            else
                i += 1
            end
        end
        if i == self.length
            return false
        end
    end

    def my_none
        i = 0
        while i < self.length
            if yield(self[i]) == false
                i += 1
            else
                return false
            end
        end
        if i == self.length
            return true
        end
    end

    def my_count(x = nil)
        i = 0
        if num
            result = []
            while i < self.length
                result << self[i] if i == x
                i += 1
            end
            return result
        else
            count = 0
            while i < self.length
                count += 1
                i += 1
            end
            return count
        end
    end

    def my_map(proc=nil)
        i = 0
        result = []
        if proc
            while i < self.length
                result << proc.call(self[i])
                i += 1
            end
            return result
        else
            while i < self.length
                result << yield(self[i])
                i += 1
            end
            return result
        end
    end

    def my_inject(memo=nil)
        i = 0
        if memo
            while i < self.length
                memo = yield(memo, self[i])
                i += 1
            end
            return memo
        else
            memo = self[0]
            while i < self.length
                memo = yield(memo, self[i])
                i += 1
            end
            return memo
        end
    end

    def multiply_els
        return self.my_inject {|x,y| x * y}
    end
    
end