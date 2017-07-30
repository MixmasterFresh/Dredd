defmodule WorkerManager.Queue do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, nil, name: name)
  end

  def init(_) do
    {:ok, :queue.new()}
  end

end
