require "colorize"

class Centipede
attr_reader :art

def initialize
@art = [
  "
                          .    .
                           )  (
  _ _ _ _ _ _ _ _ _ _ _   (.--.)
  {{ { { { { { { { { { { ( ^_^ )
  >>>>>>>>>>>>>>>>>>>>>>>>>>>-->
    10 guesses left
    ".colorize(:green),
    "
                         .    .
                          )  (
    _ _ _ _ _ _ _ _ _    (.--.)
    { { { { { { { { { { ( ^_^ )
    >>>>>>>>>>>>>>>>>>>>>>>>-->
      9 guesses left
      ".colorize(:green),
      "
                         .    .
                          )  (
      _ _ _ _ _ _ _ _    (.--.)
      { { { { { { { { { ( ^_^ )
        >>>>>>>>>>>>>>>>>>>>>-->
        8 guesses left.
        ".colorize(:green),
        "
                         .    .
                          )  (
        _ _ _ _ _ _ _    (.--.)
        { { { { { { { { ( ^_^ )
          >>>>>>>>>>>>>>>>>>>-->
          7 guesses left.
          ".colorize(:yellow),
          "
                           .    .
                            )  (
              _ _ _ _ _    (.--.)
              { { { { { { ( ^_^ )
              >>>>>>>>>>>>>>>>>-->
            6 guesses left.
            ".colorize(:yellow),
            "
                             .    .
                              )  (
                    _ _ _    (.--.)
                    { { { { ( ^_^ )
                  >>>>>>>>>>>>>>>-->
              5 guesses left.
              ".colorize(:yellow),
              "
                               .    .
                                )  (
                        _ _    (.--.)
                        { { { ( ^_^ )
                        >>>>>>>>>>>-->
                4 guesses left.
                ".colorize(:yellow),
                "
                                 .    .
                                  )  (
                             _    (.--.)
                               { ( ^_^ )
                              >>>>>>>>-->
                  3 guesses left.
                  ".colorize(:red),
                  "


                                     (.--.)
                                    ( ^_^ )
                                    >>>>-->
                    2 guesses left.
                    ".colorize(:red),
                    "



                                      ( ^_^ )

                       1 guess left!
                      ".colorize(:red),
                      "
                                              .    .
                                               )  (
                      _ _ _ _ _ _ _ _ _ _ _   (.--.)
                      {{ { { { { { { { { { { ( ^_^ )
                      >>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                            Guess a word with me!
                        ".colorize(:cyan),
                        "
                                                   ^_^
                                              \n
                                          YOU LOSE".colorize(:red)

]

end
end
