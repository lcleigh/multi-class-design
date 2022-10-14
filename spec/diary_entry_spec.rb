require "diary_entry"

RSpec.describe DiaryEntry do
    context "an entry is created" do
        it "returns entry as a string wiht a colon" do
            diary_entry = DiaryEntry.new("12/10/2022", "Today was a good day.")
            expect(diary_entry.entry).to eq "12/10/2022: Today was a good day."
        end
        it "returns date" do
            diary_entry = DiaryEntry.new("12/10/2022", "Today was a good day.")
            expect(diary_entry.date).to eq "12/10/2022"
        end
        it "returns contents in a string" do
            diary_entry = DiaryEntry.new("12/10/2022", "Today was a good day.")
            expect(diary_entry.contents).to eq "Today was a good day."
        end
        it "gives word count as an integer" do
            diary_entry = DiaryEntry.new("12/10/2022", "Today was a good day.")
            expect(diary_entry.word_count).to eq 5
        end
        it "gives reading time rounded to an integer given wpm" do
            diary_entry = DiaryEntry.new("12/10/2022", "Today was a good day.")
            expect(diary_entry.reading_time(2)).to eq 3
        end
        it "one phone number is extracted from the contents" do
            diary_entry = DiaryEntry.new("12/10/2022", "Sarah: 07544444444.")
            expect(diary_entry.extract_numbers).to eq ["07544444444"]
        end
        it "two phone numbers is extracted from the contents" do
            diary_entry = DiaryEntry.new("11/10/2022", "Sarah: 07544444444, Mike: 01526333333")
            expect(diary_entry.extract_numbers).to eq ["07544444444", "01526333333"]
        end
    end
end