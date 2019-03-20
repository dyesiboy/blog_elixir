defmodule Blog.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blog.Accounts.User

  schema "posts" do
    field :title, :string
    field :context, :string
    field :published, :boolean, default: false
    belongs_to(:user,  User)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :context, :published, :user_id])
    |> validate_required([:title, :context, :published, :user_id])
  end
end
