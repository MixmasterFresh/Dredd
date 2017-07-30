defmodule WorkerManager.Worker do
  use GenServer

  def start_link(worker_definition) do
    # GenServer.start_link()
  end

  def init() do
    {:ok, :waiting}
  end
end
