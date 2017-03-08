defmodule GraphqlTest.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema
  import_types GraphqlTest.Schema.Types

  # 查询定义
  query do

    # 字段定义
    field :posts, list_of(:post) do
      resolve &GraphqlTest.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &GraphqlTest.UserResolver.all/2
    end

    # 返回单个对象
    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &GraphqlTest.PostResolver.find/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &GraphqlTest.UserResolver.find/2
    end

  end
end
