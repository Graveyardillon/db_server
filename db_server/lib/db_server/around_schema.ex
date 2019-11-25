defmodule DbServer.AroundSchema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      use DbServer.SchemaShared

      import Ecto.Changeset
      import Ecto

      #alias Ecto.Multi
    end
  end
end