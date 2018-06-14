{:ok, changeset} = Insertions.insert_service(%{service: service}, "General Cleaning-Rabbit")
new_service = ServicesRepo.insert(changeset)

service_translation = ServicesRepo.get_by(ServiceTranslation, serviceId new_service.id)

{:ok, changeset}} = Insertions.insert_service_translation(%{service_translation: service_translation}, new_service)

new_service_translation = ServicesRepo.insert(changeset)

old_qs = from(q in ServiceQuestion, where: q.service_id == ^400002) |> ServicesRepo.all

{:ok, changesets} = Insertions.insert_service_questions(%{questions: old_qs}, new_service)
results = changesets |> Enum.map(fn x -> ServicesRepo.insert(x) end) 

generated_questions_id = results |> Enum.map(fn {:ok, value} -> value.id end)

ServicesRepo.get(ServiceQuestionTranslation, 38) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now)

ServicesRepo.get(ServiceQuestionTranslation, 41) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 200)

ServicesRepo.get(ServiceQuestionTranslation, 44) |> Map.from_struct |> Map.delete(:id) |> Map.
put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 201)

ServicesRepo.get(ServiceQuestionTranslation, 47) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 202)


ServicesRepo.get(ServiceQuestionTranslation, 50) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 203)

ServicesRepo.get(ServiceQuestionTranslation, 53) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 204)

ServicesRepo.get(ServiceQuestionTranslation, 56) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 205) 


ServicesRepo.get(ServiceQuestionTranslation, 59) |> Map.from_struct |> Map.delete(:id) |> Map.put(:createdAt, Insertions.now) |> Map.put(:updatedAt, Insertions.now) |> Map.put(:questionId, 206)

