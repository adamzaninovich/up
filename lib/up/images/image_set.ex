defmodule Up.Images.ImageSet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "image_sets" do
    field(:name, :string)
    field(:token, Ecto.UUID)
    has_many(:images, Up.Images.Image)

    timestamps()
  end

  @doc false
  def changeset(image_set, attrs) do
    image_set
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> create_token()
    |> validate_required([:token])
    |> unique_constraint(:token)
  end

  defp create_token(%{valid?: true, data: %{token: nil}} = changeset) do
    put_change(changeset, :token, Ecto.UUID.generate())
  end

  defp create_token(changeset), do: changeset
end
