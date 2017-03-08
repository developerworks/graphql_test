defmodule GraphqlTest.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: GraphqlTest.Repo

  object :user do
    # 字段:id的类型为一个特殊的类型:id
    field :id, :id
    field :name, :string
    field :email, :string
    # 一个User有多个Post
    field :posts, list_of(:post), resolve: assoc(:posts)
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    # Post属于一个User
    field :user, :user, resolve: assoc(:user)
  end
end
