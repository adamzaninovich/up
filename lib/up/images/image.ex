defmodule Up.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field(:binary_data, :binary)
    field(:binary_type, :string)
    field(:index, :integer)
    belongs_to(:image_set, Up.Images.ImageSet)

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:index, :binary_data, :binary_type])
    |> validate_required([:index, :binary_data, :binary_type])
  end
end
