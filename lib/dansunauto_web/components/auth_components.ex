defmodule DansunautoWeb.AuthComponents do
  @moduledoc """
  Chrome and card shell shared by the `/users/*` account pages.

  Wraps every auth screen in the same storefront header/footer the home page
  uses, so logging in never drops you onto an unbranded page.
  """
  use Phoenix.Component

  # Module-qualified: HomeComponents (imported via `use`) defines a clashing footer/1.
  alias DansunautoWeb.AutoComponents

  attr :id, :string, default: "auth-page"
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :width_class, :string, default: "max-w-md", doc: "card column width"

  slot :inner_block, required: true
  slot :links, doc: "optional row of secondary links rendered under the card"

  def auth_shell(assigns) do
    ~H"""
    <%!-- Deliberately not `page-typography`: that legacy sheet forces serif h1/h2
          and would override the `font-display` headings the new home page uses. --%>
    <div id={@id} class="flex min-h-screen flex-col bg-white font-sans text-body antialiased">
      <AutoComponents.top_bar />
      <AutoComponents.header_info />
      <AutoComponents.primary_nav />

      <section class="flex-1 bg-[#f5f5f3] px-4 py-16 sm:px-6 sm:py-24 lg:px-8">
        <div class={["mx-auto", @width_class]}>
          <div class="rounded-lg border border-line bg-white px-6 py-10 shadow-sm sm:px-12 sm:py-14">
            <header class="text-center">
              <span class="text-xs font-semibold uppercase tracking-[0.18em] text-brand">
                Dansun Auto
              </span>
              <h1 class="mt-2 font-display text-3xl uppercase tracking-wide text-ink sm:text-4xl">
                {@title}
              </h1>
              <p :if={@subtitle} class="mt-3 text-sm leading-6 text-body">{@subtitle}</p>
            </header>

            <div class="mt-10">
              {render_slot(@inner_block)}
            </div>
          </div>

          <p :if={@links != []} class="mt-6 text-center text-sm text-body">
            {render_slot(@links)}
          </p>
        </div>
      </section>

      <AutoComponents.footer />
      <AutoComponents.back_to_top />
    </div>
    """
  end

  @doc """
  Inline link styled for the auth card footer row.
  """
  attr :navigate, :string, default: nil
  attr :href, :string, default: nil
  slot :inner_block, required: true

  def auth_link(assigns) do
    ~H"""
    <.link
      navigate={@navigate}
      href={@href}
      class="font-semibold text-ink underline underline-offset-4 hover:text-brand hover:no-underline"
    >
      {render_slot(@inner_block)}
    </.link>
    """
  end
end
