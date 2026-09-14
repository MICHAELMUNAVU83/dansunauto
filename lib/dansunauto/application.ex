defmodule Dansunauto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DansunautoWeb.Telemetry,
      Dansunauto.Repo,
      {DNSCluster, query: Application.get_env(:dansunauto, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Dansunauto.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Dansunauto.Finch},
      # Site settings cache (loads once from DB, invalidated on save)
      {Dansunauto.SiteSettings, []},
      # Start to serve requests, typically the last entry
      DansunautoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dansunauto.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DansunautoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
