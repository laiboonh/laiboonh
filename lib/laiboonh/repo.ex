defmodule Laiboonh.Repo do
  use Ecto.Repo,
    otp_app: :laiboonh,
    adapter: Ecto.Adapters.Postgres
end
