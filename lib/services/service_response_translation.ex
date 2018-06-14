defmodule ServisheroDatabase.Services.ServiceResponseTranslation do
  alias ServisheroDatabase.Services.ServiceResponse
  use Ecto.Schema
  import Ecto.Changeset

  schema "responseTranslation" do
    field :active, :integer
    field :createdAt, :utc_datetime
    field :updatedAt, :utc_datetime
    field :image_url, :string
    field :languageCode, :string
    field :response_order, :integer
    field :response_value, :string
    field :text, :string

    belongs_to :response, ServiceResponse, foreign_key: :responseId
  end

  @cast_attrs [
    :active,
    :createdAt,
    :updatedAt,
    :image_url,
    :languageCode,
    :response_order,
    :response_value,
    :text,
    :responseId
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end
end
