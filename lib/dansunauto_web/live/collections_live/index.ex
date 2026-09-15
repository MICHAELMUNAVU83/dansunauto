defmodule DansunautoWeb.CollectionsLive.Index do
  use DansunautoWeb, :live_view

  # Module-qualified for the same reason as HomeLive: HomeComponents (imported
  # by `use DansunautoWeb, :live_view`) defines a clashing footer/1.
  alias DansunautoWeb.AutoComponents

  alias Dansunauto.Shop

  @impl true
  def mount(_params, _session, socket) do
    collections = Shop.list_collections_for_display()

    {:ok,
     socket
     |> assign(:page_title, "Spare Part Categories — Dansun Auto Care")
     |> assign(:collections, collections)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id="collections-page"
      class="min-h-screen bg-white font-sans text-[16px] font-light leading-[1.6] text-body antialiased"
    >
      <AutoComponents.top_bar />
      <AutoComponents.header_info />
      <AutoComponents.primary_nav />

      <%!-- Hero strip --%>
      <div class="border-b border-line bg-[#F7F7F7]">
        <div class="mx-auto max-w-wrap px-4 py-14">
          <a
            href="/"
            class="mb-6 inline-flex items-center gap-1.5 text-[13px] font-semibold uppercase tracking-wide text-mute transition hover:text-brand"
          >
            <svg class="h-3.5 w-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M15 19l-7-7 7-7"
              />
            </svg>
            Home
          </a>
          <p class="text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            Shop Spare Parts
          </p>
          <h1 class="mt-2 font-display text-4xl font-extrabold text-ink sm:text-5xl">
            All Part Categories
          </h1>
          <p class="mt-3 text-[15px]">
            {length(@collections)} {if length(@collections) == 1,
              do: "category",
              else: "categories"} of quality parts for a wide range of makes and models.
          </p>
        </div>
      </div>

      <%!-- Collections grid --%>
      <div class="mx-auto max-w-wrap px-4 py-16">
        <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          <a :for={collection <- @collections} href={collection.href} class="group block">
            <div class="relative aspect-[4/3] overflow-hidden bg-ink">
              <img
                :if={collection.image not in [nil, ""]}
                src={collection.image}
                alt={collection.name}
                loading="lazy"
                class="h-full w-full object-cover opacity-70 transition duration-500 group-hover:scale-105 group-hover:opacity-90"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-ink via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-6">
                <h2 class="font-display text-xl font-extrabold text-white">{collection.name}</h2>
                <div class="mt-2 flex items-center justify-between gap-4">
                  <span class="text-[13px] uppercase tracking-widest text-white/70">
                    {collection.item_count} {if collection.item_count == 1,
                      do: "part",
                      else: "parts"}
                  </span>
                  <span class="inline-flex items-center gap-1.5 bg-white/15 px-3 py-1 text-[11px] font-semibold uppercase tracking-widest text-white backdrop-blur-sm transition group-hover:bg-brand">
                    Shop
                    <svg
                      class="h-3 w-3 transition-transform group-hover:translate-x-0.5"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M17 8l4 4m0 0l-4 4m4-4H3"
                      />
                    </svg>
                  </span>
                </div>
              </div>
            </div>
          </a>
        </div>

        <div
          :if={@collections == []}
          class="flex flex-col items-center justify-center py-24 text-center"
        >
          <p class="font-display text-2xl font-extrabold text-ink">No part categories yet</p>
          <p class="mt-2 text-[15px]">
            Can&#8217;t find what you need? Call us on
            <a href="tel:+254724335924" class="font-semibold text-brand">+254 724 335924</a>
            and we&#8217;ll source the part for you.
          </p>
        </div>
      </div>

      <AutoComponents.footer />
      <AutoComponents.back_to_top />
      <AutoComponents.cart_drawer />
    </div>
    """
  end
end
