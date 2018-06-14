defmodule ServisheroDatabase.Services.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "category" do
    field :active, :integer
    field :city, :integer
    field :createdAt, :utc_datetime
    field :description, :string
    field :featured, :integer
    field :imageUrl, :string
    field :name, :string
    field :slug, :string
    field :sort, :integer
    field :updatedAt, :utc_datetime
  end

  @cast_attrs [
    :active,
    :city,
    :createdAt,
    :description,
    :featured,
    :imageUrl,
    :name,
    :slug,
    :sort,
    :updatedAt
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end
end
