[
  mappings: [
    "test.foo": [
      doc: "Documentation for test.foo goes here.",
      to: "test.foo",
      datatype: :binary,
      default: "bar"
    ],
    "test.baz": [
      doc: "Documentation for test.baz goes here.",
      to: "test.baz",
      datatype: :atom,
      default: :qux
    ],
    "test.debug.level": [
      doc: """
      Set the appropriate tracing options.
      Valid options are:
        - active:       tracing is enabled
        - active-debug: tracing is enabled, with debugging
        - passive:      tracing must be manually invoked
        - off:          tracing is disabled

      Defaults to off
      """,
      to: "test.debug_level",
      datatype: [enum: [:active, :'active-debug', :passive, :off]],
      default: :off
    ]
  ],
  translations: [
    "test.debug.level": fn val ->
      case val do
        :active ->         {:on, []}
        :'active-debug' -> {:on, [:debug]}
        :passive ->        {:on, [:passive]}
        :off     ->        {:off, []}
      end
    end
  ]
]
