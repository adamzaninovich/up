defmodule Up.Repo.Migrations.CreateImageSets do
  use Ecto.Migration

  def change do
    create table(:image_sets) do
      add :name, :string
      add :token, :uuid

      timestamps()
    end

    create unique_index(:image_sets, [:token])
  end
end
