defmodule BlogWeb.Resolvers.CommentResolver do
  alias Blog.Content

  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    comment_input = Map.merge(input, %{user_id, current_user.id})
    Content.create_comment(comment_input)
  end

end
