defmodule BlogWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias BlogWeb.Schema.Types

  import_types(Types.UserType)
end
