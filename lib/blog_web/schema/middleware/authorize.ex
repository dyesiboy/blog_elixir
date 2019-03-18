defmodule BlogWeb.Schema.Middleware.Authorize do
  @behavious Absinthe.Middleware

  def call(resolution, role) do
    with %{current_user: current_user} <- resolution_context,
         true <- correct_role?(current_user, role) do
    do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "unauthorizded"})
    end
  end

  defp correct_role?(%{}, :any), do: true
  defp correct_role?(%{role: role}, role), do: true
  defp correct_role?(_,_), do: false

end
