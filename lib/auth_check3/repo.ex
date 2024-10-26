defmodule AuthCheck3.Repo do
  use Ecto.Repo,
    otp_app: :auth_check3,
    adapter: Ecto.Adapters.Postgres
end
