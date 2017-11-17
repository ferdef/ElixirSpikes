defmodule CliTest do
  use ExUnit.Case
  doctest M3uCreator.CLI

  import M3uCreator.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "path returned by option parsing when path is passed" do
    assert parse_args(["./"]) == "./"
  end
end
