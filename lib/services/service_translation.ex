defmodule ServisheroDatabase.Services.ServiceTranslation do
  alias ServisheroDatabase.Services.{Service}
  use Ecto.Schema
  import Ecto.{Changeset, Query}

  schema "servicetranslation" do
    field :body_text, :string
    field :description, :string
    field :languageCode, :string
    field :name, :string
    field :search_terms, :string
    field :createdAt, :utc_datetime
    field :updatedAt, :utc_datetime

    belongs_to :service, Service, foreign_key: :serviceId
  end

  @cast_attrs [
    :body_text,
    :description,
    :languageCode,
    :name,
    :search_terms,
    :serviceId,
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
