defmodule ServisheroDatabase.Services.ServiceAttribute do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias ServisheroDatabase.Services.{Service}

  schema "service_attribute" do
    field :attribute, :string
    belongs_to :service, Service
  end

  def last_record(query \\ __MODULE__) do
    from(
      q in query,
      limit: 1,
      select: q.id,
      order_by: [desc: :id]
    )
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, [:attribute, :service_id, :id])
  end
end
