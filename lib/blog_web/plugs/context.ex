defmodule BlogWeb.Plugs.Context do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "Autorization"),
         {:ok, claim} <- Blog.Guardian.decode_and_verify(token),
         {:ok, user} <- Blog.Guardian.resource_from_claims(token) do
          %{current_user: user}
    else
      _ -> %{}
    end
  end

end
