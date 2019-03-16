defmodule BlogWeb.Resolvers.UserResolver do
  alias Blog.Accounts

  def users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}

  end
end
