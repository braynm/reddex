defmodule Reddit.Server do
  use GenServer
  alias Reddit.Api
  
  def init(_) do
    {:ok, load("philippines")}
  end
  
  defp load(key) do
    Map.put(%{}, "philippines", Api.get(key))
  end
  
  def handle_cast({:put, key}, state) do
    {:noreply, Map.put(state, key, load(key))}
  end

  def handle_call({:list}, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_info(:get, state, old_state) do
    {:reply, old_state}
  end

  def get(pid) do
    GenServer.call(pid, {:list})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def put(pid, key) do
    GenServer.cast(pid, {:put, key})
  end

  def start do
    GenServer.start_link(Reddit.Server, nil, [])
  end
end
