require "diary"
require "diary_entry"
require "todo"

RSpec.describe "diary_integration" do
    context "some diary entries are added" do
        it "list all entries added" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("12/10/2022", "Today was a good day.")
            diary_entry_2 = DiaryEntry.new("13/10/2022", "Today I ate some cheese, it was tasty.")
            diary.add_to_diary(diary_entry_1)
            diary.add_to_diary(diary_entry_2)
            expect(diary.list_all_entries).to eq [diary_entry_1, diary_entry_2]
        end
        it "the correct contents are returned for the given date" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("12/10/2022", "Today was a good day.")
            diary_entry_2 = DiaryEntry.new("13/10/2022", "Today I ate some cheese, it was tasty.")
            diary.add_to_diary(diary_entry_1)
            diary.add_to_diary(diary_entry_2)
            expect(diary.read_past_entry("12/10/2022")).to eq "Today was a good day."   
        end
        it "returns a message if there are no entries on given date" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("12/10/2022", "Today was a good day.")
            diary_entry_2 = DiaryEntry.new("13/10/2022", "Today I ate some cheese, it was tasty.")
            diary.add_to_diary(diary_entry_1)
            diary.add_to_diary(diary_entry_2)
            expect(diary.read_past_entry("09/10/2022")).to eq "There is no entry for this day."
        end
        it "returns the best entry to read given wpm and time avail" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("12/10/2022", "Today was a good day.") #5
            diary_entry_2 = DiaryEntry.new("13/10/2022", "Today I ate some cheese, it was tasty.") #8
            diary_entry_1.reading_time(2)
            diary_entry_2.reading_time(2)
            diary.add_to_diary(diary_entry_1)
            diary.add_to_diary(diary_entry_2)
            expect(diary.select_best_entry(2, 4)).to eq diary_entry_2
        end
    end

    context "some tasks are created" do
        it "adds the not done tasks to the incomplete list" do
            diary = Diary.new
            to_do_1 = ToDo.new("wash up")
            to_do_2 = ToDo.new("mop kitchen")
            diary.add_todo(to_do_1)
            diary.add_todo(to_do_2)
            expect(diary.todo_incomplete).to eq [to_do_1, to_do_2]
        end
        it "adds the tasks to correct lists base on if they are done or not" do
            diary = Diary.new
            to_do_1 = ToDo.new("wash up")
            to_do_2 = ToDo.new("mop kitchen")
            to_do_1.mark_done!
            diary.add_todo(to_do_1)
            diary.add_todo(to_do_2)
            expect(diary.todo_incomplete).to eq [to_do_2]
            expect(diary.todo_complete).to eq [to_do_1]
        end
    end

    context "some phone numbers are extracted" do
        it "returns a list of the phone numebrs as strings given one diary entry" do
            diary = Diary.new
            diary_entry = DiaryEntry.new("11/10/2022", "Sarah: 07544444444")
            phone_numbers = diary_entry.extract_numbers
            expect(diary.contacts_list(phone_numbers)).to eq ["07544444444"]
        end
        it "returns a list of the phone numebrs as strings given more than one diary entry" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("11/10/2022", "Sarah: 07544444444  Mike: 01546777777" )
            diary_entry_2 = DiaryEntry.new("08/10/2022", "Sarah: 07544444444")
            phone_numbers = diary_entry_1.extract_numbers + diary_entry_2.extract_numbers
            expect(diary.contacts_list(phone_numbers)).to eq ["07544444444", "01546777777"]
        end
    end
end