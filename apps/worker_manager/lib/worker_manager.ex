defmodule WorkerManager do
  use Supervisor

  def start(_, _) do
    children = [
      supervisor(WorkerManager.Supervisor, []),
      worker(WorkerManager.Queue, [:jobs])
    ]
    opts = [strategy: :one_for_one, name: WorkerManager]
    Supervisor.start_link(children, opts)
  end
end
