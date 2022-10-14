class DiaryEntry
    def initialize(date, contents)
      @date = date
      @contents = contents
      @phonenumbers = []
    end
    
    def entry
        return "#{@date}: #{@contents}"
    end
    def date
        return @date
    end
  
    def contents
        return @contents
    end
    
    def word_count  
        word_count = @contents.split(/[ !?,.&()]/).count
        return word_count
    end
    
    def reading_time(wpm)
        word_count = @contents.split(/[ !?,.&()]/).count
        return (word_count.to_f / wpm).round
    end
  
    def extract_numbers
        @contents.scan(/[0-9]{11}/).each do |number|
        @phonenumbers << number
        end
    end
    
  end