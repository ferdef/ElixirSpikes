defmodule M3uCreator.CLI do
  @default_path "./"

  def main(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean,
                                                 concurrent: :boolean],
                                     aliases:  [ h: :help,
                                                 c: :concurrent])
    case parse do
      { [ help: true ], _, _ } -> :help
      { [ concurrent: true], [path], _ } -> { path, :concurrent }
      { [ concurrent: true], _ , _ } -> { @default_path, :concurrent }
      { _, [path], _ } -> path
      _ -> @default_path
    end
  end
end
