if Code.ensure_loaded?(Poison) do
  defimpl Poison.Encoder, for: Decimal do
    def encode(decimal, _opts), do: <<?", Decimal.to_string(decimal)::binary, ?">>
  end

  defimpl Poison.Encoder, for: [Ecto.Date, Ecto.Time, Ecto.DateTime] do
    def encode(dt, _opts), do: <<?", @for.to_iso8601(dt)::binary, ?">>
  end

  defimpl Poison.Encoder, for: Ecto.Association.NotLoaded do
    def encode(%{__owner__: owner, __field__: field}, _) do
      raise "cannot encode association #{inspect field} from #{inspect owner} to " <>
            "JSON because the association was not loaded. Please make sure you have " <>
            "preloaded the association or remove it from the data to be encoded"
    end
  end
end
