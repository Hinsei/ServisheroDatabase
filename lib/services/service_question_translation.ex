defmodule ServisheroDatabase.Services.ServiceQuestionTranslation do
  alias ServisheroDatabase.Services.{ServiceQuestion}
  use Ecto.Schema
  import Ecto.{Changeset, Query}

  schema "questionTranslation" do
    field :languageCode, :string
    field :question, :string
    field :question_sub_text, :string
    field :tooltip_text, :string
    field :createdAt, :utc_datetime
    field :updatedAt, :utc_datetime
    belongs_to :question_original, ServiceQuestion, foreign_key: :questionId
  end

  @cast_attrs [
    :languageCode,
    :question,
    :question_sub_text,
    :tooltip_text,
    :createdAt, 
    :updatedAt,
    :questionId
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
