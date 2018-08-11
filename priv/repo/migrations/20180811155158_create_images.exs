defmodule Up.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add(:index, :integer)
      add(:binary_data, :binary)
      add(:binary_type, :string)
      add(:image_set_id, references(:image_sets, on_delete: :delete_all))

      timestamps()
    end

    create(unique_index(:images, [:image_set_id, :index]))
    create(index(:images, [:image_set_id]))
  end
end
