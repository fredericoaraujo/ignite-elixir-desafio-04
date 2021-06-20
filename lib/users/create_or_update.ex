defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.{Agent, User}

  def call(%{name: name, email: email, cpf: cpf}) when is_bitstring(cpf) do
    User.build(name, email, cpf)
    |> save_user()
  end

  def call(%{name: _name, email: _email, cpf: cpf}) when not is_bitstring(cpf) do
    {:error, "Cpf must be a String"}
  end

  defp save_user({:ok, %User{} = user}) do
    Agent.save(user)
    {:ok, "User created with successfully"}
  end

  defp save_user({:error, _reason} = error), do: error
end
