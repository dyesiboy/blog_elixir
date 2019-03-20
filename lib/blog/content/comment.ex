defmodule Blog.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Account.User
  alias Blog.Content.Post

  schema "comments" do
    field :content, :string
    belongs_to(:user, User)
    belongs_to(:post, Post)
    field :user_id, :id
    field :post, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content])
  end
end
