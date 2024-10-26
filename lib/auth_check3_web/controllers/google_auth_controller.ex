# this is my google auth controller where I make the requests and setup callback methods
# a lot of below methods are provided from ueberauth module


defmodule AuthCheck3Web.GoogleAuthController do
  alias AuthCheck3Web.UserAuth
  alias AuthCheck3.Accounts
  use AuthCheck3Web, :controller
  require Logger

	plug Ueberauth
  plug :fetch_session

  def request(conn, _params) do
     Phoenix.Controller.redirect(conn, to: Ueberauth.Strategy.Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do

    email = auth.info.email

    case Accounts.get_user_by_email(email) do
      nil ->
        # user does not exist, so create a new user
        user_params = %{
          email: email
        }

        # registering a new user
        case Accounts.register_oauth_user(user_params) do
          {:ok, user} ->
            UserAuth.log_in_user(conn, user)
            # this is used for sending the confimation mail to /dev/mailbox
            # in traditional login system provided by phoenix, this is done
            # via handling the form "save" event binding in the "user_registration_live.ex" file
            # but i have decided to handle this step at the registration backend for oauth registration
            Accounts.deliver_user_confirmation_instructions(
              user,
              &url(~p"/users/confirm/#{&1}")
            )

          {:error, changeset} ->
            Logger.error("Failed to create user #{inspect(changeset)}.")
            conn
            |> put_flash(:error, "Failed to create user.")
            |> redirect(to: ~p"/")
        end

      user ->
        # user exists, update session or other details if necessary
        UserAuth.log_in_user(conn, user)
    end
  end
end
