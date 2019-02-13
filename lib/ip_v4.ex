defmodule IPv4 do
  @enforce_keys [:octets]
  defstruct [:octets]

  # A complex guard
  defmacro is_octet(number) do
    quote do
      is_integer(unquote(number)) and unquote(number) >= 0 and unquote(number) <= 255
    end
  end

  def new(a, b, c, d) when is_octet(a) and is_octet(b) and is_octet(c) and is_octet(d) do
    %IPv4{octets: {a, b, c, d}}
  end

  def to_string(%IPv4{octets: {a, b, c, d}}) do
    "#{a}.#{b}.#{c}.#{d}"
  end
end