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
        [_x | xs] -> 1 + len(xs)
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
      do_len2(0, list)
    end

    defp do_len2(result, list) do
      case list do
        nil -> result
        [] -> result
        [_x | xs] -> do_len2(result + 1, xs)
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
      reverseR(list, [])
    end

    defp reverseR(list, acc) do
      case list do
        [] -> acc
        [x] -> [x] ++ acc
        [x | xs] -> reverseR(xs, [x] ++ acc)
      end
    end

    @doc """
    fold left ver
    ## Examples
    iex> E99.P5.fold_reverse([1,2,3])
    [3,2,1]

    iex> E99.P5.fold_reverse([1,2,3])
    [3, 2, 1]

    iex> E99.P5.fold_reverse([])
    []

    iex> E99.P5.fold_reverse([1])
    [1]

    iex> E99.P5.fold_reverse([1,2])
    [2, 1]

    """
    def fold_reverse(list) do
      list
      |> List.foldl([], fn x, acc -> [x] ++ acc end)
    end
  end

  defmodule P6 do
    @doc """
    P06 (*) Find out whether a list is a palindrome.
    A palindrome can be read forward or backward; e.g. (x a m a x).
    iex> E99.P6.is_palindrome([1,2,3,2,1])
    true

    iex> E99.P6.is_palindrome([1,2,3])
    false

    iex> E99.P6.is_palindrome(["a", "b", "b", "a"])
    true
    """
    def is_palindrome(list) do
      list ===
        list
        |> List.foldl([], fn x, acc -> [x] ++ acc end)
    end
  end

  defmodule P7 do
    @doc """
    P07 (**) Flatten a nested list structure.
    Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

    iex> E99.P7.flatten(["a",["b",["c","a","d"],"e"]])
    ["a","b","c","a","d","e"]
    """
    def flatten(nested_list) do
      # これは.....
      List.flatten(nested_list)
    end

    @doc """
    see: https://github.com/dwango/S99/blob/master/src/main/scala/jp/co/dwango/s99/P07.scala

    iex> E99.P7.flatten2(["a",["b",["c","a","d"],"e"]])
    ["a","b","c","a","d","e"]
    """
    def flatten2(nested_list) do
      do_flatten(nested_list)
    end

    defp do_flatten(list) do
      case list do
        # do_flatten を処理側で2つ繋げる発想が出てこなかった
        # head がlistだったらこいつを再帰して2番目のパターンに持っていく
        # 末尾再帰ではないので、巨大なデータを入れるとダメそう
        [h | t] when is_list(h) -> do_flatten(h) ++ do_flatten(t)
        [x | xs] -> [x] ++ do_flatten(xs)
        [] -> []
      end
    end
  end

  defmodule P8 do
    @doc """
    (**) Eliminate consecutive duplicates of list elements.
    If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
    Example:

    iex> E99.P8.compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
    [:a, :b, :c, :a, :d, :e]
    """
    def compress(list) do
      do_compress(list, [])
    end

    defp do_compress(list, acc) do
      last =
        acc
        |> List.last()

      case list do
        [] -> acc
        [x | xs] when last === x -> do_compress(xs, acc)
        [x | xs] -> do_compress(xs, acc ++ [x])
      end
    end

    @doc """
    fold left version.

    iex> E99.P8.fold_compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
    [:a, :b, :c, :a, :d, :e]
    """
    def fold_compress(list) do
      list
      |> List.foldl([], fn x, acc -> if(List.last(acc) === x, do: acc, else: acc ++ [x]) end)
    end
  end
end
