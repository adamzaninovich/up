defmodule Up.Images do
  @moduledoc """
  The Images context.
  """

  import Ecto.Query, warn: false
  alias Up.Repo

  alias Up.Images.ImageSet

  @doc """
  Returns the list of image_sets.

  ## Examples

      iex> list_image_sets()
      [%ImageSet{}, ...]

  """
  def list_image_sets do
    Repo.all(ImageSet)
  end

  @doc """
  Gets a single image_set.

  Raises `Ecto.NoResultsError` if the Image set does not exist.

  ## Examples

      iex> get_image_set!(123)
      %ImageSet{}

      iex> get_image_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_image_set!(id), do: Repo.get!(ImageSet, id)

  @doc """
  Creates a image_set.

  ## Examples

      iex> create_image_set(%{field: value})
      {:ok, %ImageSet{}}

      iex> create_image_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_image_set(attrs \\ %{}) do
    %ImageSet{}
    |> ImageSet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a image_set.

  ## Examples

      iex> update_image_set(image_set, %{field: new_value})
      {:ok, %ImageSet{}}

      iex> update_image_set(image_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_image_set(%ImageSet{} = image_set, attrs) do
    image_set
    |> ImageSet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ImageSet.

  ## Examples

      iex> delete_image_set(image_set)
      {:ok, %ImageSet{}}

      iex> delete_image_set(image_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_image_set(%ImageSet{} = image_set) do
    Repo.delete(image_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking image_set changes.

  ## Examples

      iex> change_image_set(image_set)
      %Ecto.Changeset{source: %ImageSet{}}

  """
  def change_image_set(%ImageSet{} = image_set) do
    ImageSet.changeset(image_set, %{})
  end
end
