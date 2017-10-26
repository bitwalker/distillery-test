[
  mappings: [
    "test.env": [
      doc: "Provide documentation for test.env here.",
      to: "test.env",
      datatype: :atom,
      default: :dev
    ],
    "test.start_signal_max_demand": [
      commented: true,
      default: -1,
      datatype: :integer,
      doc: "The maximum number of start signal events handled per scheduler",
      hidden: true,
      to: "test.start_signal_max_demand"
    ],
    "test.some_val": [
      doc: "Just a sample transformed value",
      to: "test.another_val",
      datatype: :binary,
      default: "none"
    ],
    "test.debug_level": [
      doc: "Provide documentation for test.debug_level here.",
      to: "test.debug_level",
      datatype: [enum: [:info, :warn, :error]],
      default: :info
    ]    
  ],
  transforms: [
    "test.some_val": fn conf ->
      case Conform.Conf.get(conf, "test.some_val") do
        [] -> nil
        [{_,nil}] -> nil
        [{_,val}] -> String.to_atom(val)
      end
    end,
    "test.start_signal_max_demand": fn confpid  ->
      [{_,val}] = Conform.Conf.get(confpid, "test.start_signal_max_demand")
      case val do
        n when is_integer(n) and n > 0 -> n
        _ -> System.schedulers_online * 5
      end
    end,
  ]  
]
