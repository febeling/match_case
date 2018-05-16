defmodule MatchCaseTest do
  use ExUnit.Case

  def data do
    %{
      data: %{
        description: "Hotelzimmer Typ 2",
        elements: [
          %{
            description: "Hotelzimmer Typ 2",
            elements: [
              %{
                description: "Hotelzimmer Typ 2",
                elements: [
                  %{
                    description: "Hotelzimmer Typ 2",
                    elements: [],
                    id: 11,
                    path: "b.c.d",
                    projectUuid: "70a95b7e-6c9f-4798-985e-feececadb2df",
                    uuid: "7e2098db-4049-4444-848b-e545d05eb64a",
                    version: 7
                  }
                ],
                id: 10,
                path: "b.c",
                projectUuid: "70a95b7e-6c9f-4798-985e-feececadb2df",
                uuid: "00272a12-c28d-42a5-a90f-bda52b94f239",
                version: 7
              }
            ],
            id: 9,
            path: "b",
            projectUuid: "70a95b7e-6c9f-4798-985e-feececadb2df",
            uuid: "2f61b5e9-6936-49cf-8bb3-ba3605a14f92",
            version: 7
          },
          %{
            description: "Hotelzimmer Typ 2",
            elements: [
              %{
                description: "Hotelzimmer Typ 2",
                elements: [],
                id: 8,
                path: "a.b",
                projectUuid: "70a95b7e-6c9f-4798-985e-feececadb2df",
                uuid: "668b94f7-85b8-46d0-9ba0-a3e2610e499a",
                version: 7
              }
            ],
            id: 7,
            path: "a",
            projectUuid: "70a95b7e-6c9f-4798-985e-feececadb2df",
            uuid: "3ceb761b-6ea7-4531-a580-e2ace5e2cace",
            version: 7
          }
        ],
        id: 6,
        path: nil,
        projectUuid: "70a95b7e-6c9f-4798-985e-feececadb2df",
        uuid: "233ecec1-9095-4be7-a8b8-8b1a775bf191",
        version: 7
      }
    }
  end

  test "match example" do
    actual = data()

    # response pattern (1)
    response = %{
      data: %{
        elements: [
          %{elements: [%{elements: [%{elements: []}]}]},
          %{elements: [%{elements: []}]}
        ],
        path: nil
      }
    }

    # check equality of `response` with literal value (2)
    assert %{
             data: %{
               elements: [
                 %{elements: [%{elements: [%{elements: []}]}]},
                 %{elements: [%{elements: []}]}
               ],
               path: nil
             }
           } == response

    # check match of `response` with literal value (3) - OK
    assert match?(
             %{
               data: %{
                 elements: [
                   %{elements: [%{elements: [%{elements: []}]}]},
                   %{elements: [%{elements: []}]}
                 ],
                 path: nil
               }
             },
             actual
           )

    # check match of `response` with literal value (4) - FAILURE
    assert match?(
             ^response,
             actual
           )
  end
end
