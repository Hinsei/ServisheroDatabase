use Mix.Config

config :servishero_database, ServisheroDatabase.ServicesRepo,
  adapter: Ecto.Adapters.MySQL

config :servishero_database, ServisheroDatabase.ProductsRepo,
  adapter: Ecto.Adapters.MySQL

import_config "dev.secret.exs"
