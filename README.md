# MatchCase

Strand case of match behaviour.

Problem: using a literal value in a match produces different behaviour than
a pinned variable.

In test/match_case_test.exs:

(3) should behave the same way as (4), but the former passes, while the latter
fails.

See shell output (including versions of Elixir and Erlang) below.

## Shell session output

```
febeling:match_case/ (master✗) $ elixir -v                                                                                                     [12:43:41]
Erlang/OTP 20 [erts-9.2.1] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Elixir 1.6.1 (compiled with OTP 20)
febeling:match_case/ (master✗) $ mix test                                                                                                      [12:44:03]


  1) test match example (MatchCaseTest)
     test/match_case_test.exs:67
     match (match?) failed
     The following variables were pinned:
       response = %{data: %{elements: [%{elements: [%{elements: [%{elements: []}]}]}, %{elements: [%{elements: []}]}], path: nil}}
     code:  assert match?(^response, actual)
     right: %{
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
     stacktrace:
       test/match_case_test.exs:107: (test)



Finished in 0.02 seconds
1 test, 1 failure

Randomized with seed 555643
```
