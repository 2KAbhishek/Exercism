defmodule FileSniffer do
  def type_from_extension(extension) do
    extension_map = %{
      exe: "application/octet-stream",
      bmp: "image/bmp",
      png: "image/png",
      jpg: "image/jpg",
      gif: "image/gif"
    }

    extension_map[String.to_atom(extension)]
  end

  def type_from_binary(file_binary) do
    # Please implement the type_from_binary/1 function
  end

  def verify(file_binary, extension) do
    # Please implement the verify/2 function
  end
end
