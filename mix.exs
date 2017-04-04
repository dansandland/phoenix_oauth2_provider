defmodule PhoenixOauth2Provider.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :phoenix_oauth2_provider,
     version: @version,
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps(),

     # Hex
     description: "The easy way of setting up OAuth 2.0 provider in your Phoenix app",
     package: package(),

      # Docs
      name: "PhoenixOauth2Provider",
      docs: [source_ref: "v#{@version}", main: "PhoenixOauth2Provider",
             canonical: "http://hexdocs.pm/phoenix_oauth2_provider",
             source_url: "https://github.com/danschultzer/phoenix_oauth2_provider",
             extras: ["README.md"]]
   ]
  end

  def application do
    [extra_applications: extra_applications(Mix.env)]
  end

  defp extra_applications(:test), do: [:postgrex, :ecto, :logger]
  defp extra_applications(_), do: [:logger]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_oauth2_provider, github: "danschultzer/ex_oauth2_provider", branch: :master},
      {:gettext, "~> 0.13"},
      {:phoenix, "~> 1.3.0-rc"},

      {:phoenix_ecto, "~> 3.2", only: :test},
      {:phoenix_html, "~> 2.6", only: :test},

      {:ex_machina, "~> 1.0", only: :test},
      {:postgrex, ">= 0.11.1", only: :test},
      {:credo, "~> 0.7", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      maintainers: ["Dan Shultzer"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/danschultzer/phoenix_oauth2_provider"},
      files: ~w(lib) ++ ~w(LICENSE mix.exs README.md)
    ]
  end
end