defmodule ServisheroDatabase.Products.SaleItemTranslation do
  alias ServisheroDatabase.Services.Service
  alias ServisheroDatabase.Products.SaleItem
  use Ecto.Schema
  import Ecto.Changeset


  schema "sales_item_translation" do
    field :active, :integer
    field :description, :string
    field :display_name, :string
    field :hero_earnings, :decimal
    field :sh_earnings, :decimal
    field :inclusions, :string
    field :language_code, :string
    field :list_price, :decimal
    field :skill_id, :integer
    field :sub_display_name, :string
    field :sales_item_type_id, :string
    field :parent_sales_item_id, :integer
    field :duration, :decimal

    belongs_to :service, Service
    belongs_to :sales_item, SaleItem
  end

  @cast_attrs [
    :active,
    :description,
    :display_name,
    :hero_earnings,
    :sh_earnings,
    :inclusions,
    :language_code,
    :list_price,
    :skill_id,
    :sub_display_name,
    :sales_item_type_id,
    :parent_sales_item_id,
    :duration,
    :service_id,
    :sales_item_id
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end

end
