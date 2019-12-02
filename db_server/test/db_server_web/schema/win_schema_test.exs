defmodule DbServerWeb.WinSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "win schema test." do
    @insert_params %{
      win_count: 0
    }

    test "crud test." do
      
    end
  end
end