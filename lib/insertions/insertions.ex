defmodule ServisheroDatabase.Insertions do
  alias ServisheroDatabase.ServicesRepo
  alias ServisheroDatabase.Services.{
    Service, 
    ServiceAttribute, 
    ServiceTranslation,
    ServiceQuestion
  }

  def insert(reference_id, service_name) do
    information =
      reference_id
      |> check_reference()
      |> extract_information()

    with {:ok, service} <- insert_service(information, service_name),
         {:ok, service_translation} <- insert_service_translation(information, service),
         {:ok, service_attribute} <- insert_service_attributes(information, service),
         {:ok, service_questions} <- insert_service_questions(information, service)
    do
      #IO.inspect service
      #IO.inspect service_translation
      #IO.inspect service_attribute
      #IO.inspect service_questions
      #IO.inspect service_questions_translation
    else
      e -> IO.inspect "not working"
    end
  end

  def insert_service(%{service: service}, name) do
    new_service_id = Service.last_record |> ServicesRepo.one |> Kernel.+(1)

    service =
      service
      |> Map.put(:id, new_service_id)
      |> Map.put(:search_terms, name)
      |> Map.put(:createdAt, now())
      |> Map.put(:updatedAt, now())
      |> Map.from_struct()

    {:ok, Service.changeset(%Service{}, service)}
  end

  def insert_service_questions(information, service) do
    last_id = ServiceQuestion.last_record() |> ServicesRepo.one()
    results =
      insert_service_question(information.questions, service.id, last_id, [])
    {:ok, results}
  end

  def insert_service_question([], _id, _last_id, acc), do: acc
  def insert_service_question([head | tail], id, last_id, acc) do
    new_id = last_id + 1
    changeset =
      head
      |> Map.put(:id, new_id)
      |> Map.put(:service_id, id)
      |> Map.from_struct()
      |> ServiceQuestion.changeset()

    insert_service_question(tail, id, new_id, acc ++ [changeset])
  end

  def insert_service_translation(information, service) do
    new_id = ServiceTranslation.last_record |> ServicesRepo.one |> Kernel.+(1)

    service_translation =
      information.service_translation
      |> Map.put(:id, new_id)
      |> Map.put(:serviceId, service.id)
      |> Map.put(:createdAt, now())
      |> Map.put(:updatedAt, now())
      |> Map.from_struct()

    {:ok, ServiceTranslation.changeset(service_translation)}
  end

  def insert_service_attributes(information, service) do
    last_id = ServiceAttribute.last_record() |> ServicesRepo.one()

    results = 
      insert_service_attribute(information.service_attributes, service.changes.id, last_id, [])
    {:ok, results}
  end

  def insert_service_attribute([], _id, _last_id, acc) do
    acc
  end
  def insert_service_attribute([ head | tail], id, last_id, acc) do
    new_id  = last_id + 1
    changeset = 
      head
      |> Map.put(:service_id, id)
      |> Map.put(:id, new_id)
      |> Map.from_struct()
      |> ServiceAttribute.changeset()

    insert_service_attribute(tail, id, new_id, acc ++ [changeset])
  end

  #handle services first whichle innclude service question, question translation, response, response transltaion and service attribute
  
  def check_reference(reference_id) do
    Service
    |> ServicesRepo.get(reference_id)
    |> ServicesRepo.preload([
      :service_translation, 
      :service_attributes, 
      [
        questions: [
          :translated_questions,
          [
            responses: :response_translation
          ]
        ]
      ]
    ])
  end

  def extract_information(service) do
    %{
      service_translation: service_translation,
      service_attributes: service_attributes,
      questions: questions
    } 
    = service

    translated_questions = 
      Enum.map(questions, fn x ->
        x.translated_questions
      end)

    responses = 
      questions
      |> List.flatten()
      |> Enum.map(fn x ->
          x.responses
        end)

     response_translation =
       responses
       |> List.flatten()
       |> Enum.map(fn x ->
            x.response_translation
          end)

    %{
      service: service,
      service_translation: service_translation,
      service_attributes: service_attributes,
      questions: questions,
      translated_questions: translated_questions,
      responses: responses,
      response_translation: response_translation
    }
  end

  def now() do
    :second |> System.system_time() |> Kernel.+(28800) |> DateTime.from_unix!
  end
end
