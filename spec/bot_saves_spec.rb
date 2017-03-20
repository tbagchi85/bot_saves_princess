# spec/bot_saves_spec.rb
require "bot_saves"
describe BotSaves do
  describe "Test of Bot Saves" do
    context "given index as '3' but grid element wrong" do
      it "wrong grid structure." do
        m = 3
        grid = [["-","-", "-", "-"], ["-", "p", "-"], ["-", "-", "m"]]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("wrong grid structure.")
      end
    end

    context "given index as '4' and '200'" do
      it "element should be odd number" do
        m = 4
        grid = [["-","-", "-", "-"], ["-", "p", "-", "-"], ["-", "-", "m", "-"], ["-","-", "-", "-", "-"]]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("element should be odd number.")
      end

      it "element should be less than 100" do
        m = 199
        grid = [["-","-", "-", "-"], ["-", "p", "-", "-"], ["-", "-", "m", "-"], ["-","-", "-", "-", "-"]]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("element should be less than 100")
      end
    end

    context "princess or bot not found" do
      it "Princess not found in Grid" do
        m = 3
        grid = [["-","-", "-"], ["-", "-", "-"], ["-", "-", "m"]]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("Princess not found in Grid")
      end

      it "Princess not found in Grid" do
        m = 3
        grid = [["-","-", "-"], ["-", "p", "-"], ["-", "-", "-"]]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("Bot not found in Grid")
      end
    end

    context "Right output" do
      it "element 3" do
        m = 3
        grid = [['-','-', '-'], ['-', 'p', '-'], ['m', '-', '-']]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("UP\\nRIGHT\\n")
      end
      it "element 5" do
        m = 5
        grid = [
                ['-','-', '-', '-', '-'],
                ['-', '-', '-', '-', '-'],
                ['-','-', 'm', '-', '-'],
                ['-','-', '-', '-', '-'],
                ['p','-', '-', '-', '-']
               ]
        expect(BotSaves.new.displayPathtoPrincess(m,grid)).to eql("DOWN\\nDOWN\\nLEFT\\nLEFT\\n")
      end

    end
  end
end