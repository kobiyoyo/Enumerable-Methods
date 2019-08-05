module Enumerable
    def my_each
        for i in 0...self.length
            yield(self[i])
        end
    end
    
    
    
    def my_each_with_index
        for i in 0...self.length
            yield(self[i],i)
        end
    end
    
    
    
    def my_select
        new_array = []
        self.my_each{|x|
            if yield(x)
                new_array << x 
            end        
        }
        return new_array
    end
    
    
    def my_all?
        self.my_each{|x|
            return false if !yield(x)
            return true
            }
    end
end