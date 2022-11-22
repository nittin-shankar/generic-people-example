defmodule Mix.Tasks.People.InsertData do
  use Mix.Task

  @all_seed_params [
    %{
      name: "Bob",
      age: 19
    },

    %{
      name: "Alice",
      age: 18
    },

    %{
      name: "Nicole",
      age: 21
    }
  ]

  def run(_argv) do
    otp_app = Application.get_env(:av_user_sync, :otp_app)
    repo = Application.get_env(:av_user_sync, :repo)
    schema = Application.get_env(:av_user_sync, :schema)

    Application.ensure_all_started(otp_app)

    insert_people(repo, schema)
  end

  def insert_people(repo, schema) do
    Enum.map(@all_seed_params, fn seed_params ->
      schema_struct = struct(schema)
      changeset = Ecto.Changeset.change(schema_struct, seed_params)

      apply(repo, :insert, [changeset, [on_conflict: :replace_all, conflict_target: :id]])
    end)

  end


end
