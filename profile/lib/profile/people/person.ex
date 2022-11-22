defmodule Profile.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "name" do
    field :age, :integer

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:age])
    |> validate_required([:age])
  end
end
