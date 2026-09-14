defmodule Dansunauto.BundlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dansunauto.Bundles` context.
  """

  @doc """
  Generate a bundle.
  """
  def bundle_fixture(attrs \\ %{}) do
    {:ok, bundle} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        title: "some title"
      })
      |> Dansunauto.Bundles.create_bundle()

    bundle
  end
end
