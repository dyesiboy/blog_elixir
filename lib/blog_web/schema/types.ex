defmodule Blog.Schema.Types do
  use Absinthe.Schema.Notation

  alias Blog.Schema.Types

  import_types(Types.UserType)
end
