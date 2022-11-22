defmodule Profile.Repo.Migrations.CreateName do
  use Ecto.Migration

  def change do
    create table(:name) do
      add :age, :integer

      timestamps()
    end
  end
end
