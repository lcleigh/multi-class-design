class Diary
    def initialize
        @diary_entries_list = []
        @to_do_incomplete = []
        @to_do_complete = []
        @contacts_list = []
    end
    
    def add_to_diary(diary_entry)
        @diary_entries_list << diary_entry
    end
    
    def read_past_entry(date)
        if @diary_entries_list.length == 0
            return "You have no diary entries."
        else
            @diary_entries_list.each do |diary_entry|
                if diary_entry.date == date
                    return diary_entry.contents
                else
                    return "There is no entry for this day."
                end
            end
        end
    end
    
    def list_all_entries
        if @diary_entries_list.length == 0
            return "You have no diary entries."
        else
            return @diary_entries_list
        end
    end
    
    def select_best_entry(wpm, minutes)
        max_words = wpm * minutes

        if @diary_entries_list.length == 0
            return "You have no diary entries."
        elsif readable_entries = @diary_entries_list.filter do |diary_entry|
            diary_entry.reading_time(wpm) <= max_words
            end
            sorted_by_longest = readable_entries.sort_by do |diary_entry| 
            diary_entry.word_count
            end
            sorted_by_longest
            return sorted_by_longest.last

        end
    end
    
    def add_todo(task)
        if task.done? == false
            @to_do_incomplete << task
        else
            @to_do_complete << task
        end
    end
    
    def todo_incomplete
        if @to_do_incomplete.length == 0
            return "You have nothing in your todo list. Go relax."
        else
            return @to_do_incomplete
        end
    end

    def todo_complete
        if @to_do_incomplete.length == 0 && @to_do_complete.length == 0
            return "You have not completed any tasks because you haven't added anything to your todo list."
        else
            return @to_do_complete
        end
    end
         
    def contacts_list(phone_numbers)
        phone_numbers.each do |phone_number|
            @contacts_list << phone_number
        end
        return @contacts_list.uniq
    end
     
  end

# diary = Diary.new
# diary_entry_1 = DiaryEntry.new("12/10/2022", "Today was a good day.")
# diary_entry_2 = DiaryEntry.new("13/10/2022", "Today I ate some cheese, it was tasty.")
# diary.add_to_diary(diary_entry_1)
# diary.add_to_diary(diary_entry_2)
# diary.list_all_entries