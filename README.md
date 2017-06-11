# Reddit

Using Reddit API in Elixir lang - Storing data in GenServer

# Usage

```
 # Use GenServer directly
 {:ok, pid} = Reddit.Server.start
 Reddit.Server.put(pid, "philippines") # Scond argument is the subreddt E.G(r/elixir)
 Reddit.Server.get(pid, "philippines") # gets the fetched data from Reddit API
 Reddit.Server.get(pid) # Get all fetched subreddit
 
 # This is used by GenServer
 Reddit.Api.get("philippines") # directly get the API response - List
 # Sample output
 [%{comments: 42, title: "Open Thread: What to do in June 2017"},
 %{comments: 368, title: "/r/Philippines GrMD 2017"},
 %{comments: 30,
   title: "Cainta detention center gets three aircons and three labanderas for detainees"}]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `reddit` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:reddit, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/reddit](https://hexdocs.pm/reddit).

