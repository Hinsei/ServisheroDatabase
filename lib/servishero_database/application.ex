defmodule ServisheroDatabase.Application do
  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    children = [
      supervisor(ServisheroDatabase.ServicesRepo, []),
      supervisor(ServisheroDatabase.ProductsRepo, [])
    ]

    opts = [strategy: :one_for_one, name: ServisheroDatabase.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
