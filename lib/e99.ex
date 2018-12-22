defmodule E99 do
  @moduledoc """
    ninety nine elixir problem
    s99やp99などが元ネタ
  """

  defmodule P1 do
    @doc """
    ## Examples
      iex(1)> E99.P1.last([1,2,3,4])
      {:ok, 4}
      iex(2)> E99.P1.last([1])
      {:ok, 1}
      iex(3)> E99.P1.last([])
      {:error, ""}
    """
    def last([x]), do: {:ok, x}
    def last([_ | xs]), do: last(xs)
    def last([]), do: {:error, ""}
  end

  defmodule P2 do
    @doc """
    ## Examples
      iex> E99.P2.but_last [1]
      {:ok, 1}
      iex> E99.P2.but_last [2]
      {:ok, 2}
      iex> E99.P2.but_last [1,2]
      {:ok, 1}
      iex> E99.P2.but_last [1,2,3]
      {:ok, 2}
      iex> E99.P2.but_last []
      {:error, ""}
    """
    def but_last([x]), do: {:ok, x}
    def but_last([x, _]), do: {:ok, x}
    def but_last([_ | xs]), do: but_last(xs)
    def but_last([]), do: {:error, ""}
  end

  defmodule P3 do
    @doc """
    P03 (*) Find the K'th element of a list.
    The first element in the list is number 1.
    ## Examples
    iex> E99.P3.element_at(["a","b","c","d","e","f"], 4)
    {:ok, "d"}
    iex> E99.P3.element_at(["a","b","c","d","e","f"],10)
    {:error, nil}
    """
    def element_at(list, index) do
      run(list, index, 1)
    end

    defp run([h | _], index, index), do: {:ok, h}

    defp run([_ | t], index, acc) do
      run(t, index, acc + 1)
    end

    defp run([], _, _), do: {:error, nil}

    @doc """
    別解 下記参考
    indexを減らしていく方式
    https://github.com/dwango/S99/blob/master/src/main/scala/jp/co/dwango/s99/P03.scala
    ## Examples
    iex> E99.P3.element_at2(["a","b","c","d","e","f"], 4)
    {:ok, "d"}
    iex> E99.P3.element_at2(["a","b","c","d","e","f"],10)
    {:error, nil}
    """
    def element_at2(list, index) do
      case list do
        [x | _] when index === 1 -> {:ok, x}
        [_ | xs] when index > 1 -> element_at2(xs, index - 1)
        _ -> {:error, nil}
      end
    end
  end
end
