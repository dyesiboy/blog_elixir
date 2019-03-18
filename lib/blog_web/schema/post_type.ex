defmodule BlogWeb.Schema.Types.PostType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Blog.Repo

  object :post_type do
    field(:id, :id)
    field(:title, :string)
    field(:context, :string)
    field(:published, :boolean)
    field(:user, :user_type, resolve: assoc(:user))
  end

  input_object :post_input_type do
    field(:title, non_null(:string))
    field(:context, non_null(:string))
    field(:published, non_null(:boolean))

  end
end
