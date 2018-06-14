defmodule ServisheroDatabase.Services.ServiceQuestion do
  alias ServisheroDatabase.Services.{
    Service, 
    ServiceAttribute, 
    ServiceQuestionTranslation,
    ServiceResponse
  }
  use Ecto.Schema

  import Ecto.{Changeset, Query}

  schema "question" do
    field :active, :integer
    field :duration_per_unit, :decimal
    field :is_optional, :integer
    field :is_tooltip, :integer
    field :num_service_unit, :decimal
    field :question_order,  :integer
    field :question_sub_text, :string
    field :question_subset_id, :integer
    field :question_text, :string
    field :question_type_id, :integer
    field :sales_item_type_id, :integer
    field :tooltip_image_url, :string
    field :tooltip_text, :string
    belongs_to :service_attribute, ServiceAttribute
    belongs_to :service, Service
    has_many :responses, ServiceResponse, foreign_key: :question_id
    has_one :translated_questions, ServiceQuestionTranslation, foreign_key: :questionId
  end

  @cast_attrs [
    :active,
    :duration_per_unit,
    :is_optional,
    :is_tooltip,
    :num_service_unit,
    :question_order,
    :question_sub_text,
    :question_subset_id,
    :question_text,
    :question_type_id,
    :sales_item_type_id,
    :tooltip_image_url,
    :tooltip_text,
    :service_attribute_id,
    :service_id,
  ]

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs)
  end

  def danger(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @cast_attrs ++ [:id])
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
