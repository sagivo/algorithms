require "rspec"
require "./game_of_life.rb"

describe "game of life" do
  context 'start game' do
    let(:game_of_life) { GameOfLife.new(5, 5) }
    let(:generate_cells) { game_of_life.generate_cells }
    let(:cells) { game_of_life.cells }
    it "should create 25 cells" do
      expect { generate_cells }.to change(cells, :count).by(25)
    end
    context 'x and y for each cell should be set within limits' do
      before do
        game_of_life.generate_cells
      end
      let(:cell) { cells.first }
      let(:x) { cell.x }
      let(:y) { cell.y }
      it "x should not be nil" do
        x.should_not be_nil
      end
      it "y should not be nil" do
        y.should_not be_nil
      end
    end
  end
  context 'next tick' do
    let(:game_of_life) { GameOfLife.new(3, 3) }
    let!(:generate_cells) { game_of_life.generate_cells }
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
      cell1.alive?.should eq true
    end
    it "cell2 should live" do
      cell2.alive?.should eq true
    end
    it "cell3 should die" do
      cell3.alive?.should eq false
    end
    it "cell4 should live" do
      cell4.alive?.should eq true
    end
    it "cell5 should remain dead" do
      cell5.alive?.should eq false
    end
    it "cell6 should remain dead" do
      cell6.alive?.should eq false
    end
    it "cell7 should remain dead" do
      cell7.alive?.should eq false
    end
    it "cell8 should remain dead" do
      cell8.alive?.should eq false
    end
    it "cell9 should remain dead" do
      cell9.alive?.should eq false
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
  context 'find cell by x and y' do
    let(:game_of_life) { GameOfLife.new(3, 3) }
    let!(:generate_cells) { game_of_life.generate_cells }
    let(:cell3) { game_of_life.cells[2] }
    it "should return cell 3" do
      game_of_life.find_cell_by_x_and_y(2, 0).should eq cell3
    end
  end
end

describe Cell do
  let(:game_of_life) { GameOfLife.new(10, 10) }
  let(:cell) { Cell.new(1, 1, true) }
  let(:cell1) { Cell.new(1, 2, true) }
  let(:cell2) { Cell.new(2, 2, true) }
  let(:cell3) { Cell.new(2, 1, false) }
  let(:cell4) { Cell.new(1, 0, false) }
  let(:cell5) { Cell.new(3, 2) }
  before do
    game_of_life.cells = [
      cell, cell1, cell2, cell3, cell4, cell5
    ]
  end
  context 'neighbours' do
    it "should equal cell1, cell2, cell3, cell4" do
      cell.neighbours_among(game_of_life.cells).should =~ [cell1, cell2, cell3, cell4]
    end
  end
  context "alive neighbours" do
    it "should return alive neighbour cells - cell1, cell2" do
      cell.alive_neighbours_among(game_of_life.cells).should =~ [cell1, cell2]
    end
  end
  context "dead neighbours" do
    it "should return dead neighbour cells - cell3, cell4" do
      cell.dead_neighbours_among(game_of_life.cells).should =~ [cell3, cell4]
    end
  end
  context 'should live?' do
    context '0 neighbours' do
      let(:cell) { Cell.new(1, 1, true) }
      let(:cells) { [Cell.new(4, 3, true)] }
      it "should not be alive" do
        cell.show_stay_live?(cells).should eq false
      end
    end
    context '1 neighbour' do
      let(:cell) { Cell.new(1, 1, true) }
      let(:cells) { [Cell.new(2, 2, true)] }
      it "should not be alive" do
        cell.show_stay_live?(cells).should eq false
      end
    end
    context '2 neighbours' do
      let(:cell) { Cell.new(1, 1, true) }
      let(:cells) { [Cell.new(2, 2, true), Cell.new(1, 2, true)] }
      it "should not be alive" do
        cell.show_stay_live?(cells).should eq true
      end
    end
    context '3 neighbours' do
      let(:cell) { Cell.new(1, 1, true) }
      let(:cells) { [Cell.new(2, 2, true), Cell.new(1, 2, true), Cell.new(0, 1, true)] }
      it "should not be alive" do
        cell.show_stay_live?(cells).should eq true
      end
    end
  end
  context 'should be reborn from death' do
    context '3 neighbours' do
      let(:cell) { Cell.new(1,1) }
      let(:cells) { [Cell.new(1, 0, true), Cell.new(0, 1, true), Cell.new(2, 2, true)] }
      it "should not be alive" do
        cell.should_be_reborn?(cells).should eq true
      end
    end
    context 'neighbours less than 3' do
      let(:cell) { Cell.new(1,1) }
      let(:cells) { [Cell.new(1, 0, true), Cell.new(0, 1, true)] }
      it "should not be alive" do
        cell.should_be_reborn?(cells).should eq false
      end
    end
    context 'neighbours more than 3' do
      let(:cell) { Cell.new(1,1) }
      let(:cells) { [Cell.new(1, 0, true), Cell.new(0, 1, true), Cell.new(2, 2, true), Cell.new(0, 0, true)] }
      it "should not be alive" do
        cell.should_be_reborn?(cells).should eq false
      end
    end
  end
  context 'die' do
    let(:cell) { Cell.new(1, 1, true) }
    it "should kill the cell" do
      expect { cell.die }.to change(cell, :alive).from(true).to(false)
    end
  end
  context 'reborn' do
    let(:cell) { Cell.new(1, 1) }
    it "should kill the cell" do
      expect { cell.reborn }.to change(cell, :alive).from(false).to(true)
    end
  end
end
