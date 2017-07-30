defmodule WorkerManager.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: :worker_supervisor)
  end

  def start_worker(worker_definition) do
    case WorkerManager.Validator.validate(worker_definition) do
      :ok -> Supervisor.start_child(:worker_supervisor, worker(WorkerManager.Worker, [], id: String.to_atom(worker_definition.name), restart: :transient))
      _ -> {:error, "Worker Definition does not have a name."}
    end
  end

  def deactivate_worker(name) do
    GenServer.call(name, {:deactivate})
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end
end
