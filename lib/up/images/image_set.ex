defmodule Up.Images.ImageSet do
  use Ecto.Schema
  import Ecto.Changeset


  schema "image_sets" do
    field :name, :string
    field :token, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(image_set, attrs) do
    image_set
    |> cast(attrs, [:name, :token])
    |> validate_required([:name, :token])
    |> unique_constraint(:token)
  end
end
