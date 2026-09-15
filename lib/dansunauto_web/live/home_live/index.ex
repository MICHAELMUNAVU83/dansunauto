defmodule DansunautoWeb.HomeLive.Index do
  use DansunautoWeb, :live_view

  # Called module-qualified rather than imported: HomeComponents (imported by
  # `use DansunautoWeb, :live_view`) also defines hero/1, testimonials/1 and
  # footer/1, so a bare import would be ambiguous.
  alias DansunautoWeb.AutoComponents

  alias Dansunauto.Shop

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Auto Repairs & Spare Parts in Umoja, Nairobi")
     |> assign(
       :meta_description,
       "Vehicle repairs, servicing and diagnostics plus quality spare parts at Dansun Auto " <>
         "Care in Umoja I, Nairobi. Brake pads, filters, spark plugs, belts, suspension parts " <>
         "and batteries for Toyota, Nissan, Mazda, Subaru, Honda and Mitsubishi. " <>
         "Call or WhatsApp +254 724 335924."
     )
     |> assign(:collections, Enum.take(Shop.list_collections_for_display(), 6))
     |> assign(:featured_products, featured_products())
     |> assign(:bundle, Shop.get_active_bundle_with_products())
     |> assign(:testimonials, Enum.take(Shop.list_testimonials_for_display(), 3))}
  end

  # Featured parts first; fall back to bestsellers, then to anything active, so
  # the storefront grid is never empty just because nothing is flagged.
  defp featured_products do
    [
      &Shop.list_bundle_display_products/0,
      &Shop.list_bestsellers/0,
      &Shop.list_products_for_display/0
    ]
    |> Enum.find_value([], fn fetch ->
      case fetch.() do
        [] -> nil
        products -> Enum.take(products, 8)
      end
    end)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id="home-page"
      class="bg-white font-sans text-[16px] font-light leading-[1.6] text-body antialiased"
    >
      <AutoComponents.top_bar />
      <AutoComponents.header_info />
      <AutoComponents.primary_nav />

      <%!-- The app layout already wraps us in a <main>, so the reference
            template's own <main> element is intentionally dropped here. --%>
      <AutoComponents.hero />

      <%!-- Shop first: the storefront is the point of the page, so parts you
            can actually buy sit directly under the hero. --%>
      <AutoComponents.part_grid
        products={@featured_products}
        eyebrow="Shop Online"
        title="Spare parts you can buy right now"
        class="border-b border-line"
      />
      <AutoComponents.part_categories collections={@collections} />
      <AutoComponents.service_kit bundle={@bundle} />

      <AutoComponents.reasons />
      <AutoComponents.estimate />
      <AutoComponents.brands />
      <AutoComponents.about />
      <AutoComponents.services />
      <AutoComponents.parts />
      <AutoComponents.steps />
      <AutoComponents.coupons />
      <AutoComponents.testimonials testimonials={@testimonials} />
      <AutoComponents.faq />
      <AutoComponents.contact />

      <AutoComponents.footer />
      <AutoComponents.back_to_top />
      <AutoComponents.cart_drawer />
    </div>
    """
  end
end
