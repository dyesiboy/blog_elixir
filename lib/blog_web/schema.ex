defmodule BlogWeb.Schema do
  use Absinthe.Schema

  alias BlogWeb.Resolvers
  alias BlogWeb.Schema.Middleware

  import_types(BlogWeb.Schema.Types)

  query do
    @desc "Get all list of users"
    field :users, list_of(:user_type) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "User authentication"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login_user/3)
    end

    @desc "Create a post"
    field :create_post, type: :post_type do
      arg(:input, non_null(:post_input_type))
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.PostResolver.create_post/3)
    end

    @desc "Create a comment"
    field :create_comment, type: :comment_type do
      arg(:input, non_null(:comment_input_type))
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.CommentResolver.create_comment/3)
    end
  end

end
