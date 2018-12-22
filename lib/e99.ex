defmodule E99 do
  @moduledoc """
    ninety nine elixir problem
    s99やp99などが元ネタ
  """

  defmodule P1 do
    @doc """
      iex> E99.P1.last([1,2,3,4])
      {:ok, 4}

      iex> E99.P1.last([1])
      {:ok, 1}

      iex> E99.P1.last([])
      {:error, ""}
    """
    def last([x]), do: {:ok, x}
    def last([_ | xs]), do: last(xs)
    def last([]), do: {:error, ""}
  end

  defmodule P2 do
    @doc """
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

  defmodule P4 do
    @doc """
    P04 (*) Find the number of elements of a list.

    iex> E99.P4.len([])
    0
    iex> E99.P4.len(["a","b","c","d"])
    4
    """
    def len(list) do
      case list do
        [] -> 0
        [_x] -> 1
        [_x|xs] -> 1 + len(xs)
      end
    end

    @doc """
    末尾再帰版
    参考, http://aperiodic.net/phil/scala/s-99/p04.scala

    iex> alias E99.P4 #エイリアスを使うと短く呼べる
    iex> P4.len2([])
    0
    iex> P4.len2(["a","b","c","d"])
    4
    """
    def len2(list) do
      lenR(0, list)
    end
    defp lenR(result, list) do
      case list do
        nil -> result
        [] -> result
        [_x|xs] -> lenR(result + 1, xs)
      end
    end
  end

  defmodule P5 do
    @doc """
    P05 (*) Reverse a list.
    ## Examples
    iex> E99.P5.reverse([1,2,3])
    [3,2,1]

    iex> E99.P5.reverse [1,2,3]
    [3, 2, 1]

    iex> E99.P5.reverse []
    []

    iex> E99.P5.reverse [1]
    [1]

    iex> E99.P5.reverse [1,2]
    [2, 1]

    """
    def reverse(list) do
      reverseR(list,[])
    end
    defp reverseR(list ,acc)do
      case list do
        [] -> acc
        [x] -> [x] ++ acc
        [x|xs] -> reverseR(xs, [x] ++ acc)
      end
    end

    @doc """
    fold left ver
    ## Examples
    iex> E99.P5.reverseFold([1,2,3])
    [3,2,1]

    iex> E99.P5.reverseFold([1,2,3])
    [3, 2, 1]

    iex> E99.P5.reverseFold([])
    []

    iex> E99.P5.reverseFold([1])
    [1]

    iex> E99.P5.reverseFold([1,2])
    [2, 1]

    """
    def reverseFold(list) do
      list |> List.foldl([], fn (x,acc) -> [x] ++ acc  end)
    end
  end
end
