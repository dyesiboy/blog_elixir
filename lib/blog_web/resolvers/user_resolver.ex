defmodule BlogWeb.Resolvers.UserResolver do
  alias Blog.Accounts

  def users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}

  end

  def register_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
