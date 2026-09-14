defmodule Dansunauto.BundleItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dansunauto.BundleItems` context.
  """

  @doc """
  Generate a bundle_item.
  """
  def bundle_item_fixture(attrs \\ %{}) do
    {:ok, bundle_item} =
      attrs
      |> Enum.into(%{

      })
      |> Dansunauto.BundleItems.create_bundle_item()

    bundle_item
  end
end
