defmodule Profile.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ProfileWeb.Telemetry,
      # Start the Ecto repository
      Profile.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Profile.PubSub},
      # Start Finch
      {Finch, name: Profile.Finch},
      # Start the Endpoint (http/https)
      ProfileWeb.Endpoint
      # Start a worker by calling: Profile.Worker.start_link(arg)
      # {Profile.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Profile.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProfileWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
