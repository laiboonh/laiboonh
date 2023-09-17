# test/factories/article_factory.ex
defmodule Laiboonh.RbacsFactory do
  defmacro __using__(_opts) do
    quote do
      def privilege_factory do
        %Laiboonh.Rbacs.Privilege{
          name: "default name"
        }
      end

      def role_factory do
        %Laiboonh.Rbacs.Role{
          name: "default name"
        }
      end
    end
  end
end
