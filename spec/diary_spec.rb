require "diary"

RSpec.describe Diary do
    context "initially" do
        it "will say you have no diary entries when asked to list all entries" do
            diary = Diary.new
            expect(diary.list_all_entries).to eq "You have no diary entries."
        end
        it "will say you have no diary entries if try to get an entry on a given date" do
            diary = Diary.new
            expect(diary.read_past_entry("12/09/2020")).to eq "You have no diary entries."
        end
        it "will say you have no diary entries if try to select best entry" do
            diary = Diary.new
            expect(diary.select_best_entry(2, 4)).to eq "You have no diary entries."
        end
        it "gives a message when ask for todo list" do
            diary = Diary.new
            expect(diary.todo_incomplete).to eq "You have nothing in your todo list. Go relax."
        end
        it "gives a message when ask for completedtodo list" do
            diary = Diary.new
            expect(diary.todo_complete).to eq "You have not completed any tasks because you haven't added anything to your todo list."
        end
    end
end

