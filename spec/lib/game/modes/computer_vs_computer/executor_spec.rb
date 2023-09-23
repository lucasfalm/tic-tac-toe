# frozen_string_literal: true

require './lib/game/modes/computer_vs_computer.rb'

RSpec.describe ::Game::Modes::ComputerVsComputer::Executor do
  describe "#start" do
    let(:game) { described_class.configure_game }

    subject { game.start }

    let(:computer_one_symbol) { "X" }
    let(:computer_two_symbol) { "O" }

    # let(:computer_one_symbol) { game.computer_one_symbol }
    # let(:computer_two_symbol) { game.computer_two_symbol }

    before do
      allow_any_instance_of(described_class).to receive(:watch_fight_message).and_return(true)
      allow_any_instance_of(described_class).to receive(:sleep).and_return(true)
      allow(Game::Helpers::ClearTerminalScreen).to receive(:call).and_return(true)
    end

    context "computer one win" do
      before do
        allow_any_instance_of(described_class).to receive(:hard_or_easy)
          .and_return([0], [4], [1], [5], [2], [8])
      end

      let(:expected_output) do
        <<~TEXT
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | O | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | O | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | O
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | 2
        ===+===+===
         3 | O | O
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | X | X
        ===+===+===
         3 | O | O
        ===+===+===
         6 | 7 | 8

        ===+===+===

        finish! computer one win with 'X'!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end

    context "computer two win" do
      before do
        allow_any_instance_of(described_class).to receive(:hard_or_easy)
          .and_return([0], [2], [1], [5], [4], [8])
      end

      let(:expected_output) do
        <<~TEXT
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | 1 | O
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | 1 | O
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | 4 | O
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         X | X | O
        ===+===+===
         3 | 4 | O
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | X | O
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         X | X | O
        ===+===+===
         3 | X | O
        ===+===+===
         6 | 7 | O

        ===+===+===

        finish! computer two win with 'O'!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end

    context "tie" do
      before do
        allow_any_instance_of(described_class).to receive(:hard_or_easy)
          .and_return([4], [8], [7], [1], [2], [6], [3], [5])
      end

      let(:expected_output) do
        <<~TEXT
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | 4 | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | 7 | 8

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | 7 | O

        ===+===+===
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | 7 | O

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | 1 | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         0 | O | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===
        ===+===+===

         0 | O | 2
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | O | X
        ===+===+===
         3 | X | 5
        ===+===+===
         6 | X | O

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         0 | O | X
        ===+===+===
         3 | X | 5
        ===+===+===
         O | X | O

        ===+===+===
        ===+===+===

         0 | O | X
        ===+===+===
         3 | X | 5
        ===+===+===
         O | X | O

        ===+===+===


        computer one playing with 'X'...
        ===+===+===

         0 | O | X
        ===+===+===
         X | X | 5
        ===+===+===
         O | X | O

        ===+===+===


        computer two playing with 'O'...
        ===+===+===

         0 | O | X
        ===+===+===
         X | X | O
        ===+===+===
         O | X | O

        ===+===+===

        tie!
        TEXT
      end

      it { expect{ subject }.to output(expected_output).to_stdout }
    end
  end
end
