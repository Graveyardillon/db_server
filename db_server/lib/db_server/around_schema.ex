defmodule DbServer.AroundSchema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema

      import Ecto.Changeset

      use DbServer.SchemaShared
    end
  end
end