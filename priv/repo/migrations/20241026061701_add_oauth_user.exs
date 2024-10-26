defmodule AuthCheck3.Repo.Migrations.AddOauthUser do
  use Ecto.Migration

  # i am adding one field is_oauth_user so that i can know in the database
    # if this user is oauth verified or not.
    # and also making the password field nullable because we can have
    # oauth users too
    
  def up do
    alter table(:users) do
      add :is_oauth_user, :boolean, default: false
      modify :hashed_password, :string, null: true
    end
  end

  def down do
    alter table(:users) do
      remove :is_oauth_user
      modify :hashed_password, :string, null: false
    end
  end
end
