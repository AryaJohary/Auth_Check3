defmodule AuthCheck3Web.Gettext do
  @moduledoc """
  A module providing Internationalization with a gettext-based API.

  By using [Gettext](https://hexdocs.pm/gettext),
  your module gains a set of macros for translations, for example:

      import AuthCheck3Web.Gettext

      # Simple translation
      gettext("Here is the string to translate")

      # Plural translation
      ngettext("Here is the string to translate",
               "Here are the strings to translate",
               3)

      # Domain-based translation
      dgettext("errors", "Here is the error message to translate")

  See the [Gettext Docs](https://hexdocs.pm/gettext) for detailed usage.
  """
  # use Gettext.Backend, otp_app: :auth_check3
  # the above line is recommended from elixir intellisense, but it doesn't work properly in
  # core_components.ex file even after making the changes it says I should.
  # so for now, i am leaving it as it was



  use Gettext, otp_app: :auth_check3
end
