require "rspec"
require "./game_of_life.rb"

describe "game of life" do
  context 'next tick' do
    let(:game_of_life) { GameOfLife.new(3, 3) }
    let(:cell1) { game_of_life.cells[0] }
    let(:cell2) { game_of_life.cells[1] }
    let(:cell3) { game_of_life.cells[2] }
    let(:cell4) { game_of_life.cells[3] }
    let(:cell5) { game_of_life.cells[4] }
    let(:cell6) { game_of_life.cells[5] }
    let(:cell7) { game_of_life.cells[6] }
    let(:cell8) { game_of_life.cells[7] }
    let(:cell9) { game_of_life.cells[8] }
    before do
      cell1.alive = true
      cell2.alive = true
      cell3.alive = true
      cell4.alive = true
      game_of_life.next_tick
    end
    it "cell1 should live" do
      cell1.alive.should eq true
    end
    it "cell2 should live" do
      cell2.alive.should eq true
    end
    it "cell3 should die" do
      cell3.alive.should eq false
    end
    it "cell4 should live" do
      cell4.alive.should eq true
    end
    it "cell5 should remain dead" do
      cell5.alive.should eq false
    end
    it "cell6 should remain dead" do
      cell6.alive.should eq false
    end
    it "cell7 should remain dead" do
      cell7.alive.should eq false
    end
    it "cell8 should remain dead" do
      cell8.alive.should eq false
    end
    it "cell9 should remain dead" do
      cell9.alive.should eq false
    end
    context 'double tick' do
      before do
        game_of_life.next_tick
        game_of_life.next_tick
      end
      it "cell1 should live" do
        cell1.alive.should eq true
      end
      it "cell2 should live" do
        cell2.alive.should eq true
      end
      it "cell3 should remain dead" do
        cell3.alive.should eq false
      end
      it "cell4 should live" do
        cell4.alive.should eq true
      end
      it "cell5 should live" do
        cell5.alive.should eq true
      end
      it "cell6 should remain dead" do
        cell6.alive.should eq false
      end
      it "cell7 should remain dead" do
        cell7.alive.should eq false
      end
      it "cell8 should remain dead" do
        cell8.alive.should eq false
      end
      it "cell9 should remain dead" do
        cell9.alive.should eq false
      end
    end
  end
end

describe Cell do
  context 'neighbours' do
    let(:game_of_life) { GameOfLife.new(10, 10) }
    let(:cell) { game_of_life.matrix[1][1] }
    let(:cell1) { game_of_life.matrix[1][2] }
    let(:cell2) { game_of_life.matrix[2][2] }
    let(:cell3) { game_of_life.matrix[2][1] }
    let(:cell4) { game_of_life.matrix[1][0] }
    let(:cell5) { game_of_life.matrix[3][2] }
    let(:cell6) { game_of_life.matrix[0][1] }
    let(:cell7) { game_of_life.matrix[0][0] }
    let(:cell8) { game_of_life.matrix[0][2] }
    let(:cell9) { game_of_life.matrix[2][0] }
    before do
      cell.alive = true
      cell1.alive = true
      cell2.alive = true
      cell3.alive = false
      cell4.alive = false
      cell5.alive = false
    end
    it "should equal cell1, cell2, cell3, cell4" do
      cell.neighbours(game_of_life.matrix).should =~ [cell1, cell2, cell3, cell4, cell6, cell7, cell8, cell9]
    end
    it "should return alive neighbour cells - cell1, cell2" do
      cell.alive_neighbours(game_of_life.matrix).should =~ [cell1, cell2]
    end
  end
  context 'die' do
    let!(:cell) { Cell.new(1, 1, true) }
    it "should kill the cell" do
      expect { cell.die }.to change(cell, :alive).from(true).to(false)
    end
  end
  context 'reborn' do
    let!(:cell) { Cell.new(1, 1) }
    it "should kill the cell" do
      expect { cell.reborn }.to change(cell, :alive).from(false).to(true)
    end
  end
end
