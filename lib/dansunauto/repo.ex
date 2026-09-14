defmodule Dansunauto.Repo do
  use Ecto.Repo,
    otp_app: :dansunauto,
    adapter: Ecto.Adapters.Postgres
end
