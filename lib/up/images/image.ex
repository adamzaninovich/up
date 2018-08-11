defmodule Up.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset


  schema "images" do
    field :binary_data, :binary
    field :binary_type, :string
    field :index, :integer
    field :image_set_id, :id

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:index, :binary_data, :binary_type])
    |> validate_required([:index, :binary_data, :binary_type])
  end
end
