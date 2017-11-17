defmodule BrowserTest do
  use ExUnit.Case
  doctest M3uCreator.Browser

  import M3uCreator.Browser, only: [ ls_r: 1 ]

  test "returning a complete tree map fo test subfolder" do
    results = ["./test/test_dir/a.txt", "./test/test_dir/b.txt", "./test/test_dir/subdir/c.txt"]
    assert ls_r("./test/test_dir") == results
  end
end
