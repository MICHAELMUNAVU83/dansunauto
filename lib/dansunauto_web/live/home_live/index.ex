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
     |> assign(:testimonials, Enum.take(Shop.list_testimonials_for_display(), 3))}
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
    </div>
    """
  end
end
