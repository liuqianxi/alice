defmodule Alice.Bot.Supervisor do
  @moduledoc """
  Supervises any Alice.Bot process that are started.
  """

  use Supervisor

  def start_link(_) do
    Supervisor.start_link([
      worker(Alice.Bot, [], restart: :transient)
    ], strategy: :simple_one_for_one, name: __MODULE__)
  end

  def init(_), do: :ok
end