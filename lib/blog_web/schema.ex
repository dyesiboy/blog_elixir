defmodule BlogWeb.Schema do
  use Absinthe.Schema

  import_types(Blog.Schema.Types)

  query do
    @desc "Get all list of users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.user/3)
    end
  end

  # mutation do
  # end

end
