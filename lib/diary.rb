class Diary
    def initialize
      @diary_entries_list = []
      @to_do_incomplete = []
      @to_do_complete = []
      @contacts_list = []
    end
    def add_to_diary(diary_entry)
      # add the diary entry to diary_entries
    end
    def read_past_entry(date)
      #returns the entry for the given day or returns msg that there is no entry
    end
    def list_all_entries
    end
    def select_best_entry(wpm, minutes)
    end
    def add_todo(task)
    end
    def todo_incomplete
    end
    def todo_complete
    end
    def contacts_list(phone_numbers)
      # returns a list only of unique phone numbers
    end
     
  end