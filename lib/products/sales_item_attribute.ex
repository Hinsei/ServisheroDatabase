defmodule ServisheroDatabase.Products.SaleItemAttribute do
  alias ServisheroDatabase.Products.SaleItem
  alias ServisheroDatabase.Services.ServiceAttribute
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_item_attributes" do
    field :value, :string
    field :value_type, :integer

    belongs_to :sales_item, SaleItem
    belongs_to :service_attribute, ServiceAttribute
  end

  @cast_attrs [
    :value,
    :value_type,
    :sales_item_id,
    :service_attribute_id
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end

  def danger(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs ++ [:id])
  end

end
