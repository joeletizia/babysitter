defprotocol Phoenix.HTML.Safe do
  @moduledoc """
  Defines the HTML safe protocol.

  In order to promote HTML safety, Phoenix templates
  do not use `Kernel.to_string/1` to convert data types to
  strings in templates. Instead, Phoenix uses this
  protocol which must be implemented by data structures
  and guarantee that a HTML safe representation is returned.

  Furthermore, this protocol relies on iodata, which provides
  better performance when sending or streaming data to the client.
  """

  def to_iodata(data)
end

defimpl Phoenix.HTML.Safe, for: Atom do
  def to_iodata(nil),  do: ""
  def to_iodata(atom), do: Plug.HTML.html_escape(Atom.to_string(atom))
end

defimpl Phoenix.HTML.Safe, for: BitString do
  defdelegate to_iodata(data), to: Plug.HTML, as: :html_escape
end

defimpl Phoenix.HTML.Safe, for: List do
  def to_iodata([h|t]) do
    [to_iodata(h)|to_iodata(t)]
  end

  def to_iodata([]) do
    []
  end

  def to_iodata(?<), do: "&lt;"
  def to_iodata(?>), do: "&gt;"
  def to_iodata(?&), do: "&amp;"
  def to_iodata(?"), do: "&quot;"
  def to_iodata(?'), do: "&#39;"

  def to_iodata(h) when is_integer(h) do
    h
  end

  def to_iodata(h) when is_binary(h) do
    Plug.HTML.html_escape(h)
  end

  def to_iodata({:safe, data}) do
    data
  end

  def to_iodata(other) do
    raise ArgumentError,
      "lists in Phoenix.HTML and templates may only contain integers, binaries or other lists, " <>
      "got invalid entry: #{inspect other}"
  end
end

defimpl Phoenix.HTML.Safe, for: Integer do
  def to_iodata(data), do: Integer.to_string(data)
end

defimpl Phoenix.HTML.Safe, for: Float do
  def to_iodata(data) do
    IO.iodata_to_binary(:io_lib_format.fwrite_g(data))
  end
end

defimpl Phoenix.HTML.Safe, for: Tuple do
  def to_iodata({:safe, data}), do: data
  def to_iodata(value) do
    raise Protocol.UndefinedError,
      protocol: @protocol,
      value: value
  end
end
