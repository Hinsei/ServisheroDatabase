defmodule ServisheroDatabase.Services.CategoryService do
  use Ecto.Schema
  import Ecto.Changeset

  schema "category_services__service_categories" do
    field :category_services, :integer
    field :service_categories, :integer
  end

  @cast_attrs [
    :category_services,
    :service_categories
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end
end
