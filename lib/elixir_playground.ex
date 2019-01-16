defmodule ElixirPlayground do
  @moduledoc """
  Documentation for ElixirPlayground.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirPlayground.hello
      :world

  """
  def hello do
    :world
  end

  @doc """
  Hello world.

    iex> ElixirPlayground.helloWorld("John Do")
    "Hello, John Do."
  """
  def helloWorld(someone) do
    "Hello, #{someone}."
  end
end
