defmodule DbServerWeb.ErrorView do
  use DbServerWeb, :view
  
  def render(<<status::binary-3>> <> _, assigns) when status != "all" do
    assigns
    |> Map.take([:message, :errors])
    |> Map.put(:status, String.to_integer(status))
    |> Map.put_new(:message, message(status))
  end

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  defp message("400"), do: "Bad Request"
  defp message("404"), do: "Page Not Found"
  defp message("408"), do: "Request Timeout"
  defp message("413"), do: "Payload Too Large"
  defp message("415"), do: "Unsupported media type"
  defp message("422"), do: "Validation error(s)"
  defp message("500"), do: "Internal server error"
  defp message("501"), do: "Creation error(s)"
  defp message(_), do: nil

  end
end
