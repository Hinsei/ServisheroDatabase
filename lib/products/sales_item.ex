defmodule ServisheroDatabase.Products.SaleItem do
  alias ServisheroDatabase.Services.Service
  alias ServisheroDatabase.Products.SaleItemType
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_item" do
    field :active, :integer
    field :auto_renew, :integer
    field :code, :string
    field :description, :string
    field :display_name, :string
    field :duration, :decimal
    field :hero_earnings, :decimal
    field :inclusions, :string
    field :list_price, :decimal
    field :max_sessions, :integer
    field :modifiable, :integer
    field :package_items, :string
    field :parent_sales_item_id, :integer
    field :payment_condition_id, :integer
    field :percentage_discount, :integer
    field :rules, :string
    field :sessions, :integer
    field :sh_earnings, :decimal
    field :skill_id, :integer
    field :sub_display_name, :string
    field :time_validity, :integer
    field :sales_item_type_id, :integer

    belongs_to :service, Service
  end

  @cast_attrs [
    :active,
    :auto_renew,
    :code,
    :description,
    :display_name,
    :duration,
    :hero_earnings,
    :inclusions,
    :list_price,
    :max_sessions,
    :modifiable,
    :package_items,
    :parent_sales_item_id,
    :payment_condition_id,
    :percentage_discount,
    :rules,
    :sessions,
    :sh_earnings,
    :skill_id,
    :sub_display_name,
    :time_validity,
    :sales_item_type_id,
    :service_id
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
