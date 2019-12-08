defmodule DbServerWeb.ControllerHelpers do
  import Plug.Conn
  import Phoenix.Controller

  alias DbServerWeb.Router.Helpers, as: Routes

  def creation_failed(conn, %Ecto.Changeset{} = changeset) do
    errors = translate_errors(changeset)
    render_error(conn, 501, errors: errors)
  end

  def creation_failed(conn, errors) do
    render_error(conn, 501, errors: errors)
  end

  def render_error(conn, status, assigns \\ []) do
    conn
    |> put_status(status)
    |> put_layout(false)
    |> put_view(DbServerWeb.ErrorView)
    |> render(:"#{status}", assigns)
    |> halt()
  end

  # Translates errors from a generated changeset.
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      case {message, Keyword.fetch(opts, :type)} do
         {"is invalid", {:ok, type}} -> type_error(type)
         _ -> interpolate_errors(message, opts)
      end
    end)
    |> normalize_errors()
  end

  # Addresses errors when it cannot be translated.
  defp interpolate_errors(message, opts) do
    Enum.reduce(opts, message, fn {key, value}, message ->
      pattern = "%{#{key}}"

      if String.contains?(message, pattern) do
        if String.Chars.impl_for(value) do
          String.replace(message, pattern, to_string(value))
        else
          raise "Unable to translate error: #{inspect({message, opts})}"
        end
      else
        message
      end
    end)
  end

  defp normalize_errors(errors) do
    Enum.flat_map(errors, &normalize_key_value/1)
  end

  defp normalize_key_value({key, value}) do
    case value do
      _ when value == %{} ->
        []
      
      [%{} | _] = value ->
        value = Enum.reduce(value, %{}, &Map.merge(&2, normalize_errors(&1)))
        [{key, value}]
      
      [] ->
        []
      
      value when is_map(value) ->
        [{key, normalize_errors(value)}]
      
      [value | _] ->
        [{key, value}]

    end
  end

  defp type_error(type), do: "expected type #{pretty_type(type)}"

  defp pretty_type({:array, type}), do: "list(#{pretty_type(type)})"
  defp pretty_type({:map, type}), do: "map(#{pretty_type(type)})"
  defp pretty_type(type), do: type |> inspect() |> String.trim_leading(":")
end