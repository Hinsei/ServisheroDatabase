addQuestion = fn  ori_service_id, new_service_id->
  from(q in ServiceQuestion, where: q.service_id: ^x)
  |> ServicesRepo.all
  |> Enum.map(fn x -> 
    x
    |> Map.from_struct
    |> Map.put(:service_id, new_service_id)
    |> ServiceQuestion.changeset
    end)
  end)

addQuestionTranslation = fn x ->
  Enum.map(x, fn {x, y} -> 
    ServicesRepo.get(ServiceQuestionTranslation, x)  
    |> Map.from_struct
    |> Map.put(:questionId, y)
    |> Map.put(:createdAt, Insertions.now())
    |> Map.put(:updatedAt, Insertions.now())
    |> ServiceQuestionTranslation.changeset
  end)
end

addResponse = fn x ->
  Enum.map(x, fn {x, y} ->
    from(q in ServiceResponse, where: q.question_id == ^x)
    |> ServicesRepo.all
    |> Enum.map(fn x ->
      Map.from_struct(x)
      |> Map.put(:question_id, y)
      |> ServiceResponse.changeset
    end)
  end)
end

addResponseTranslation = fn x ->
  Enum.map(x, fn {x, y} ->
    ServicesRepo.get(ServiceResponseTranslation, x)
    |> Map.from_struct
    |> Map.put(:responseId, y)
    |> Map.put(:createdAt, Insertions.now())
    |> Map.put(:updatedAt, Insertions.now())
    |> ServiceResponseTranslation.changeset
  end)
end

addSalesItemTranslation = fn x ->
  Enum.map(x, fn {x, y} ->
    ProductsRepo.get(SaleItemTranslation, x)
    |> Map.from_struct
    |> Map.put(:service_id, 400041)
    |> Map.put(:sales_item_id, y)
    |> SaleItemTranslation.changeset
  end)
end

addSalesItemAttribute = fn x ->
  Enum.map(x, fn {x, y} -> 
    from(q in SaleItemAttribute, where: q.sales_item_id == ^x)
    |> ProductsRepo.all
    |> Enum.map(fn x ->
        Map.from_struct(x)
        |> Map.put(:sales_item_id, y)
        |> SaleItemAttribute.changeset
    end)
    |> List.flatten
  end)
end
