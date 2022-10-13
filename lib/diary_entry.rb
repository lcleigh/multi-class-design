class DiaryEntry
    def initialize(date, contents)
      @date = date
      @contents = contents
      @phonenumbers = []
    end
    
    def date
      # returns date as......
    end
  
    def contents
      #return contents as string
    end
    
    def word_count  #returns the number of words as an integer
    end
    
    def reading_time(wpm) # returns the reading time in minutes to the nearest integer
    end
  
    def extract_numbers
      # gets the numbers from the contents and adds them to @phonenumbers
      # return @phonenumbers
    end
    
  end