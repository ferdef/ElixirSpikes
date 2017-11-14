defmodule M3uCreatorTest do
  use ExUnit.Case
  doctest M3uCreator

  import M3uCreator, only: [ main: 1 ]

  test ":help returned by main method with -h and --help options" do
    assert main(["-h",     "anything"]) == :help
    assert main(["--help", "anything"]) == :help
  end

end
