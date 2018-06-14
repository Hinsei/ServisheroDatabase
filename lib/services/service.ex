defmodule ServisheroDatabase.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias ServisheroDatabase.Services.{
    ServiceTranslation,
    ServiceAttribute, 
    ServiceQuestion,
  }

  schema "service" do
    field :active, :integer
    field :bodyText, :string
    field :city, :integer
    field :creditCost, :integer
    field :creditsStageTwo, :integer
    field :description, :string
    field :featured, :integer
    field :icon_url, :string
    field :imageUrl, :string
    field :inclusions, :string
    field :maxQuotes, :integer
    field :search_terms, :string
    field :searchTerms, :string
    field :service_type_id, :integer
    field :units, :string
    field :createdAt, :utc_datetime
    field :updatedAt, :utc_datetime

    has_many :service_attributes, ServiceAttribute
    has_many :questions, ServiceQuestion
    has_one :service_translation, ServiceTranslation, foreign_key: :serviceId
  end

  @cast_attrs [
    :id,
    :active,
    :bodyText,
    :city,
    :creditCost,
    :creditsStageTwo,
    :description,
    :featured,
    :icon_url,
    :imageUrl,
    :inclusions,
    :maxQuotes,
    :search_terms,
    :searchTerms,
    :service_type_id,
    :units,
    :createdAt,
    :updatedAt
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end

  def last_record(query \\ __MODULE__) do
    from(
      q in query,
      limit: 1,
      order_by: [desc: :id],
      select: q.id
    )
  end
end
