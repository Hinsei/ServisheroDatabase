defmodule ServisheroDatabase.Services.ServiceResponse do
  alias ServisheroDatabase.Services.{ServiceQuestion, ServiceResponseTranslation}
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :active, :integer
    field :image_url, :string
    field :response_order, :integer
    field :response_text, :string
    field :response_value, :string

    belongs_to :question, ServiceQuestion
    has_one :response_translation, ServiceResponseTranslation, foreign_key: :responseId
  end

  @cast_attrs [
    :active,
    :image_url,
    :response_order,
    :response_text,
    :response_value,
    :question_id
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
