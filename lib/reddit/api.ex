defmodule Reddit.Api do
  @url Application.get_env(:reddit, :reddit_url)

  def get(subreddit) do
    subreddit
    |> fetch
    |> handle_response
    |> decode_response
  end

  defp fetch(subreddit) do
    "#{@url}/r/#{subreddit}.json"
    #|> IO.puts
    |> HTTPoison.get
  end

  defp handle_response({:ok, %{status_code: 200, body: body, headers: _}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  defp handle_response({:ok, %{status_code: 302, body: body, headers: _}}) do
    {:error, "Subreddit does not exists. Please try again later."}
  end
  
  defp handle_response({:ok, %{status_code: _, body: body, headers: _}}) do
    {:error, Poison.Parser.parse!(body)}
  end

  defp decode_response({:ok, body}), do: body["data"]["children"] |> transform

  defp decode_response({:error, %{"error" => 403}}) do
    {:error, "You must invited to visit the community"}
  end

  defp decode_response({:error, body}), do: {:error, body}
  
  def transform_item(item) do
    %{
      title: item["data"]["title"],
      comments: item["data"]["num_comments"]
    }
  end

  defp transform(data) do
    data
    |> Enum.map(&__MODULE__.transform_item/1)
  end

  #Public API
  def title(thread) do
       
  end
end
