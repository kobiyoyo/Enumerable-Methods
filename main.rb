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
        return true if !block_given?
        self.my_each{|x|
            return false if !yield(x)
            return true
        }
    end
    
    def my_any?
        self.my_each{|x|
            if yield(x)
                return true 
            else
                return false
            end
            }
    end
    
    def my_none?
        self.my_each{|x|
        if yield(x)
            return false
        else
            return true
        end
        }
    end

  
    def my_count(args=nil)
        if args
            count = 0
            self.each{|x|
                if x == args      
                    count += 1    
                end    
                } 
            return count
        end
        counter = 0
        self.my_each do |x|
            if !block_given?
                return self.length
            elsif yield(x)  
                counter += 1
            end
        end
        return counter
    end

    def my_map(&block)
        new_arry = []
        self.my_each{|x|
            new_arry << block.call(x)
            }
        return new_arry
    end

  def my_inject(args=nil)
      if(args)
          accum = args
      else
          accum = self[0]
      end
      self.each{|x|
          next if accum == x 
          accum = yield(accum,x)
          }
      return accum
  
  end
 
end