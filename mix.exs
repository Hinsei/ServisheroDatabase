defmodule ServisheroDatabase.MixProject do
  use Mix.Project

  def project do
    [
      app: :servishero_database,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ServisheroDatabase.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mariaex, "~> 0.8.2"},
      {:ecto, "~> 2.1"}
    ]
  end
end
