require "todo"

RSpec.describe ToDo do
    context "when a task is created" do
        it "returns the task as a string" do
            to_do = ToDo.new("wash up")
            expect(to_do.task).to eq "wash up"
        end
        it "then i mark it done, done? will return true" do
            to_do = ToDo.new("wash up")
            expect(to_do.done?).to eq false
            to_do.mark_done!
            expect(to_do.done?).to eq true
        end
    end
end