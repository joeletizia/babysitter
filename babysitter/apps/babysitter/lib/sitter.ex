defmodule Babysitter.Sitter do
  alias Babysitter.Data.Sitter, as: SitterData
  alias Babysitter.Data.Repo, as: Repo

  @spec register_sitter(String.t, String.t) :: %SitterData{}
  def register_sitter(name, phone_number) do
    %SitterData{name: name, phone_number: phone_number}
    |> Repo.insert
  end
end
