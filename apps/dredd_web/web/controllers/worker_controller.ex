defmodule DreddWeb.WorkerController do
  use DreddWeb.Web, :controller

  def register(conn, params) do
    response = WorkerManager.register(params)
    json conn, response
  end

  def report(conn, params) do
    response = WorkerManager.report(params)
    json conn, response
  end

  def heartbeat(conn, params) do
    response = WorkerManager.heartbeat(params)
    json conn, response
  end
end
