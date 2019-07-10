defmodule Casefy.MixProject do
  use Mix.Project

  def project do
    [
      app: :casefy,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Casefy",
      description: description(),
      package: package(),
      source_url: "https://github.com/edicury/casefy"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:recase, "~> 0.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Deeply nested objects casing made easy"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "casefy",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* test),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/edicury/casefy"}
    ]
  end
end
