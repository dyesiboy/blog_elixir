defmodule Blog.Resolvers.UserResolver do
  alias Blog.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}

  end
end
