# frozen_string_literal: true

RSpec.shared_examples "when the human wins" do
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

     O | 1 | 2
    ===+===+===
     3 | 4 | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | 1 | 2
    ===+===+===
     3 | X | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | 2
    ===+===+===
     3 | X | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | 2
    ===+===+===
     3 | X | X
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | O
    ===+===+===
     3 | X | X
    ===+===+===
     6 | 7 | 8

    ===+===+===

    you win!

    TEXT
  end

  it { expect{ subject }.to output(expected_output).to_stdout }
end

RSpec.shared_context "variables - when the human wins" do
  let(:human_movements)    { [0, 1, 2] }
  let(:computer_movements) { [4, 5, 8] }
end

RSpec.shared_examples "when the computer wins" do
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

     O | 1 | 2
    ===+===+===
     3 | 4 | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | 1 | X
    ===+===+===
     3 | 4 | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | X
    ===+===+===
     3 | 4 | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | X
    ===+===+===
     3 | 4 | X
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | X
    ===+===+===
     3 | O | X
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     O | O | X
    ===+===+===
     3 | O | X
    ===+===+===
     6 | 7 | X

    ===+===+===

    game over, you lose!

    TEXT
  end

  it { expect{ subject }.to output(expected_output).to_stdout }
end

RSpec.shared_context "variables - when the computer wins" do
  let(:human_movements)    { [0, 1, 4] }
  let(:computer_movements) { [2, 5, 8] }
end

RSpec.shared_examples "when ties" do
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
     3 | O | 5
    ===+===+===
     6 | 7 | 8

    ===+===+===
    ===+===+===

     0 | 1 | 2
    ===+===+===
     3 | O | 5
    ===+===+===
     6 | 7 | X

    ===+===+===
    ===+===+===

     0 | 1 | 2
    ===+===+===
     3 | O | 5
    ===+===+===
     6 | O | X

    ===+===+===
    ===+===+===

     0 | X | 2
    ===+===+===
     3 | O | 5
    ===+===+===
     6 | O | X

    ===+===+===
    ===+===+===

     0 | X | O
    ===+===+===
     3 | O | 5
    ===+===+===
     6 | O | X

    ===+===+===
    ===+===+===

     0 | X | O
    ===+===+===
     3 | O | 5
    ===+===+===
     X | O | X

    ===+===+===
    ===+===+===

     0 | X | O
    ===+===+===
     O | O | 5
    ===+===+===
     X | O | X

    ===+===+===
    ===+===+===

     0 | X | O
    ===+===+===
     O | O | X
    ===+===+===
     X | O | X

    ===+===+===

    tie!

    TEXT
  end

  it { expect{ subject }.to output(expected_output).to_stdout }
end

RSpec.shared_context "variables - when ties" do
  let(:human_movements)    { [4, 7, 2, 3] }
  let(:computer_movements) { [8, 1, 6, 5] }
end
