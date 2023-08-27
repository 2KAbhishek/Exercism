defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name() do
    name = IO.gets("What is your character's name?\n")
    String.trim(name)
  end

  def ask_class() do
    class = IO.gets("What is your character's class?\n")
    String.trim(class)
  end

  def ask_level() do
    level = IO.gets("What is your character's level?\n")
    level |> String.trim |> String.to_integer
  end

  def run() do
    welcome()
    character = %{}
      |> Map.put(:name, ask_name())
      |> Map.put(:class, ask_class())
      |> Map.put(:level, ask_level())

    IO.puts("Your character: #{inspect(character)}")
    character
  end
end
