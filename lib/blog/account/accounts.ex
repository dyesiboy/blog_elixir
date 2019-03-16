defmodule Blog.Account.Accounts do
  alias Blog.Repo
  def create_user(attrs \\ {}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
