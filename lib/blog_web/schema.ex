defmodule BlogWeb.Schema do
  use Absinthe.Schema

  alias BlogWeb.Resolvers

  import_types(BlogWeb.Schema.Types)

  query do
    @desc "Get all list of users"
    field :users, list_of(:user_type) do

      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  # mutation do
  # end

end
