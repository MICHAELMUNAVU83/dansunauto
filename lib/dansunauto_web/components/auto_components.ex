defmodule DansunautoWeb.AutoComponents do
  @moduledoc """
  Marketing components for the Dansunauto storefront.

  Ported from the `tailwind.html` design reference; each function here is one
  section of that page, in the same order it appears there.
  """
  use Phoenix.Component

  @doc """
  Promo / secondary-nav strip above the header.
  """
  def top_bar(assigns) do
    ~H"""
    <div class="bg-ink text-white">
      <div class="mx-auto flex max-w-wrap flex-col gap-2 px-4 py-2.5 text-[13px] sm:flex-row sm:items-center sm:justify-between">
        <p class="flex flex-wrap items-center gap-x-2 gap-y-1">
          <span class="font-medium text-white">
            <span class="text-brand">Repairs, servicing &amp; spare parts</span> for Nairobi motorists
          </span>
          <span class="hidden text-white/45 sm:inline">|</span>
          <span class="text-white/65">
            Call or WhatsApp +254 724 335924 — we will confirm availability.
          </span>
        </p>
        <nav aria-label="Secondary">
          <ul class="flex flex-wrap items-center gap-x-5 gap-y-1 text-white/75">
            <li>
              <a class="transition hover:text-brand" href="/#parts">Spare Parts</a>
            </li>
            <li>
              <a class="transition hover:text-brand" href="/#services">Services</a>
            </li>
            <li>
              <a class="transition hover:text-brand" href="/#contact">Contact</a>
            </li>
            <li>
              <a class="transition hover:text-brand" href="/#faq">FAQ</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    """
  end

  @doc """
  Logo, hours, contact, search and cart summary.
  """
  def header_info(assigns) do
    ~H"""
    <div class="border-b border-line bg-white">
      <div class="mx-auto flex max-w-wrap flex-wrap items-center justify-between gap-6 px-4 py-6">
        <a href="/" class="flex shrink-0 items-center gap-3">
          <img
            src="/images/dansunauto-logo.png"
            alt="Dansun Auto Care"
            class="h-11 w-11 rounded-[10px] object-cover"
          />
          <span class="leading-none">
            <span class="block font-display text-3xl font-black uppercase tracking-tight text-ink">
              Dansun Auto <span class="text-brand">Care</span>
            </span>
            <span class="mt-1 block text-[11px] font-medium uppercase tracking-[0.28em] text-mute">
              Repairs &ndash; Servicing &ndash; Spare Parts
            </span>
          </span>
        </a>

        <div class="flex flex-wrap items-center gap-x-8 gap-y-4">
          <div class="flex items-start gap-3">
            <svg
              class="mt-0.5 h-6 w-6 shrink-0 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <circle cx="12" cy="12" r="10" />
              <polyline points="12 6 12 12 16 14" />
            </svg>
            <div class="text-[14px] leading-snug">
              <strong class="block font-medium text-ink">Working Hours</strong>
              <span>Mon - Sat: 8:00 AM - 6:00 PM</span>
            </div>
          </div>

          <div class="flex items-start gap-3">
            <svg
              class="mt-0.5 h-6 w-6 shrink-0 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.13.96.36 1.9.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.9.34 1.85.57 2.81.7A2 2 0 0 1 22 16.92z" />
            </svg>
            <div class="text-[14px] leading-snug">
              <strong class="block font-medium text-ink">Customer Support</strong>
              <a href="tel:+254724335924" class="transition hover:text-brand">+254 724 335924</a>
              <span class="text-mute">·</span>
              <a href="https://wa.me/254724335924" class="transition hover:text-brand">WhatsApp us</a>
            </div>
          </div>

          <form
            class="group flex items-center gap-2.5 rounded-full bg-[#f5f5f3] py-1.5 pl-4 pr-1.5 transition focus-within:bg-white focus-within:shadow-sm focus-within:ring-2 focus-within:ring-brand/15"
            role="search"
            onsubmit="return false;"
          >
            <label for="site-search" class="sr-only">Search spare parts</label>
            <svg
              class="h-[18px] w-[18px] shrink-0 text-mute transition group-focus-within:text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <circle cx="11" cy="11" r="8" />
              <line x1="21" y1="21" x2="16.65" y2="16.65" />
            </svg>
            <input
              id="site-search"
              type="search"
              placeholder="Search spare parts"
              class="w-40 bg-transparent text-[14px] text-ink outline-none placeholder:text-mute focus:w-52 motion-safe:transition-all [&::-webkit-search-cancel-button]:appearance-none"
            />
            <%!-- Arrow, not a second magnifier: the leading icon already
                  labels the field, so the button reads as "go". --%>
            <button
              type="submit"
              class="grid h-8 w-8 shrink-0 place-items-center rounded-full bg-brand text-white transition hover:bg-brand-700"
              aria-label="Search"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <line x1="5" y1="12" x2="19" y2="12" />
                <polyline points="12 5 19 12 12 19" />
              </svg>
            </button>
          </form>

          <%!-- Admin entry point. The storefront itself needs no account, so
                this goes straight to the log-in page. --%>
          <a
            href="/users/log_in"
            class="text-ink transition hover:text-brand"
            aria-label="Admin log in"
            title="Admin log in"
          >
            <svg
              class="h-6 w-6"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
              <circle cx="12" cy="7" r="4" />
            </svg>
          </a>

          <%!-- Opens the cart drawer (see cart_drawer/1); falls through to
                /cart on the cart and checkout pages, where CartHook disables
                the drawer. --%>
          <button
            type="button"
            onclick="(window.location.pathname==='/cart'||window.location.pathname==='/checkout') ? window.location='/cart' : window.CartDrawer && window.CartDrawer.open()"
            class="relative flex items-center gap-2 text-ink transition hover:text-brand"
            aria-label="Cart"
          >
            <svg
              class="h-6 w-6"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <circle cx="9" cy="21" r="1" />
              <circle cx="20" cy="21" r="1" />
              <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
            </svg>
            <span
              id="cart-count-badge"
              style="display:none;"
              class="absolute -right-2 -top-2 grid h-4 w-4 place-items-center rounded-full bg-brand text-[10px] font-bold text-white"
            >
              0
            </span>
          </button>
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Sticky dark primary navigation with mega menus.
  """
  def primary_nav(assigns) do
    ~H"""
    <header class="sticky top-0 z-50 bg-ink shadow-lg">
      <div class="mx-auto flex max-w-wrap flex-wrap items-center justify-between gap-4 px-4">
        <!-- Mobile toggle: CSS-only, drives the panel below via :checked + peer -->
        <input type="checkbox" id="nav-toggle" class="peer sr-only" />
        <label
          for="nav-toggle"
          class="flex cursor-pointer items-center gap-2 py-4 text-white lg:hidden"
          aria-label="Toggle navigation menu"
        >
          <svg
            class="h-6 w-6"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <line x1="3" y1="12" x2="21" y2="12" />
            <line x1="3" y1="6" x2="21" y2="6" />
            <line x1="3" y1="18" x2="21" y2="18" />
          </svg>
          <span class="text-[14px] font-medium uppercase tracking-wide">Menu</span>
        </label>
        
    <!-- Desktop nav -->
        <nav aria-label="Primary" class="hidden lg:block">
          <ul class="flex items-stretch text-[14px] font-medium uppercase tracking-wide text-white">
            <li>
              <a href="/" class="flex items-center px-5 py-5 text-brand transition hover:text-brand">
                Home
              </a>
            </li>

            <li class="group relative">
              <a
                href="/#services"
                class="flex items-center gap-1.5 px-5 py-5 transition group-hover:text-brand"
              >
                Services
                <svg
                  class="h-3.5 w-3.5"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2.5"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <polyline points="6 9 12 15 18 9" />
                </svg>
              </a>
              <ul class="invisible absolute left-0 top-full z-40 w-56 translate-y-1 border-t-2 border-brand bg-white py-2 normal-case text-ink opacity-0 shadow-xl transition group-hover:visible group-hover:translate-y-0 group-hover:opacity-100 group-focus-within:visible group-focus-within:translate-y-0 group-focus-within:opacity-100">
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Engine Repairs
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Brake Servicing
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Brakes
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    General Servicing
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Clutch Repairs
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Oil &amp; Filter Changes
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Vehicle Diagnostics
                  </a>
                </li>
                <li>
                  <a
                    class="block px-5 py-2 transition hover:bg-line hover:text-brand"
                    href="/#services"
                  >
                    Battery Replacement
                  </a>
                </li>
              </ul>
            </li>

            <li class="group relative">
              <a
                href="/#brands"
                class="flex items-center gap-1.5 px-5 py-5 transition group-hover:text-brand"
              >
                Vehicle Makes
                <svg
                  class="h-3.5 w-3.5"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2.5"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <polyline points="6 9 12 15 18 9" />
                </svg>
              </a>
              <ul class="invisible absolute left-0 top-full z-40 w-52 translate-y-1 border-t-2 border-brand bg-white py-2 normal-case text-ink opacity-0 shadow-xl transition group-hover:visible group-hover:translate-y-0 group-hover:opacity-100 group-focus-within:visible group-focus-within:translate-y-0 group-focus-within:opacity-100">
                <li>
                  <a class="block px-5 py-2 transition hover:bg-line hover:text-brand" href="/#brands">
                    Nissan
                  </a>
                </li>
                <li>
                  <a class="block px-5 py-2 transition hover:bg-line hover:text-brand" href="/#brands">
                    Subaru
                  </a>
                </li>
                <li>
                  <a class="block px-5 py-2 transition hover:bg-line hover:text-brand" href="/#brands">
                    Mazda
                  </a>
                </li>
                <li>
                  <a class="block px-5 py-2 transition hover:bg-line hover:text-brand" href="/#brands">
                    Honda
                  </a>
                </li>
                <li>
                  <a class="block px-5 py-2 transition hover:bg-line hover:text-brand" href="/#brands">
                    Mitsubishi
                  </a>
                </li>
                <li>
                  <a class="block px-5 py-2 transition hover:bg-line hover:text-brand" href="/#brands">
                    Toyota
                  </a>
                </li>
                <li class="mt-1 border-t border-line pt-1">
                  <a
                    class="block px-5 py-2 font-medium text-brand transition hover:bg-line"
                    href="/#brands"
                  >
                    All Vehicle Makes
                  </a>
                </li>
              </ul>
            </li>

            <li>
              <a href="/collections" class="block px-5 py-5 transition hover:text-brand">Shop</a>
            </li>

            <li class="group relative">
              <a
                href="/#about"
                class="flex items-center gap-1.5 px-5 py-5 transition group-hover:text-brand"
              >
                Pages
                <svg
                  class="h-3.5 w-3.5"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2.5"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <polyline points="6 9 12 15 18 9" />
                </svg>
              </a>
              <div class="invisible absolute left-0 top-full z-40 grid w-[26rem] translate-y-1 grid-cols-2 gap-x-4 border-t-2 border-brand bg-white p-5 normal-case text-ink opacity-0 shadow-xl transition group-hover:visible group-hover:translate-y-0 group-hover:opacity-100 group-focus-within:visible group-focus-within:translate-y-0 group-focus-within:opacity-100">
                <div>
                  <p class="mb-2 text-[12px] font-semibold uppercase tracking-widest text-mute">
                    Company
                  </p>
                  <ul class="space-y-1">
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#about">About Us</a>
                    </li>
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#services">Services</a>
                    </li>
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#faq">FAQ</a>
                    </li>
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#contact">
                        Contact Us
                      </a>
                    </li>
                  </ul>
                </div>
                <div>
                  <p class="mb-2 text-[12px] font-semibold uppercase tracking-widest text-mute">
                    Other
                  </p>
                  <ul class="space-y-1">
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#services">Services</a>
                    </li>
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#coupons">
                        Pricing &amp; Coupons
                      </a>
                    </li>
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#steps">FAQs</a>
                    </li>
                    <li>
                      <a class="block py-1 transition hover:text-brand" href="/#reviews">
                        Testimonials
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </li>

            <li>
              <a href="/#parts" class="block px-5 py-5 transition hover:text-brand">Spare Parts</a>
            </li>
          </ul>
        </nav>

        <a
          href="tel:+254724335924"
          class="my-2.5 inline-flex shrink-0 items-center gap-2 bg-brand px-5 py-3 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-white hover:text-ink lg:my-0 lg:self-stretch lg:py-0"
        >
          <svg
            class="h-4 w-4"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <rect x="3" y="4" width="18" height="18" rx="2" />
            <line x1="16" y1="2" x2="16" y2="6" />
            <line x1="8" y1="2" x2="8" y2="6" />
            <line x1="3" y1="10" x2="21" y2="10" />
          </svg>
          Call Now
        </a>
        
    <!-- Mobile panel: revealed by the peer checkbox above -->
        <nav
          aria-label="Mobile"
          class="order-last hidden w-full border-t border-white/10 pb-4 peer-checked:block lg:!hidden"
        >
          <ul class="divide-y divide-white/10 text-[15px] text-white">
            <li><a class="block py-3" href="/">Home</a></li>
            <li>
              <details class="group">
                <summary class="flex cursor-pointer list-none items-center justify-between py-3">
                  Services
                  <svg
                    class="h-4 w-4 transition group-open:rotate-180"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    aria-hidden="true"
                  >
                    <polyline points="6 9 12 15 18 9" />
                  </svg>
                </summary>
                <ul class="pb-2 pl-4 text-white/70">
                  <li>
                    <a class="block py-1.5" href="/#services">Engine Repairs</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#services">Brake Servicing</a>
                  </li>
                  <li><a class="block py-1.5" href="/#services">Suspension &amp; Steering</a></li>
                  <li>
                    <a class="block py-1.5" href="/#services">General Servicing</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#services">Clutch Repairs</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#services">Oil &amp; Filter Changes</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#services">Vehicle Diagnostics</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#services">Battery Replacement</a>
                  </li>
                </ul>
              </details>
            </li>
            <li>
              <details class="group">
                <summary class="flex cursor-pointer list-none items-center justify-between py-3">
                  Vehicle Makes
                  <svg
                    class="h-4 w-4 transition group-open:rotate-180"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    aria-hidden="true"
                  >
                    <polyline points="6 9 12 15 18 9" />
                  </svg>
                </summary>
                <ul class="pb-2 pl-4 text-white/70">
                  <li><a class="block py-1.5" href="/#brands">Nissan</a></li>
                  <li><a class="block py-1.5" href="/#brands">Subaru</a></li>
                  <li><a class="block py-1.5" href="/#brands">Mazda</a></li>
                  <li>
                    <a class="block py-1.5" href="/#brands">Honda</a>
                  </li>
                  <li><a class="block py-1.5" href="/#brands">Mitsubishi</a></li>
                  <li><a class="block py-1.5" href="/#brands">Toyota</a></li>
                  <li>
                    <a class="block py-1.5 text-brand" href="/#brands">All Vehicle Makes</a>
                  </li>
                </ul>
              </details>
            </li>
            <li><a class="block py-3" href="/collections">Shop</a></li>
            <li>
              <details class="group">
                <summary class="flex cursor-pointer list-none items-center justify-between py-3">
                  Pages
                  <svg
                    class="h-4 w-4 transition group-open:rotate-180"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    aria-hidden="true"
                  >
                    <polyline points="6 9 12 15 18 9" />
                  </svg>
                </summary>
                <ul class="pb-2 pl-4 text-white/70">
                  <li><a class="block py-1.5" href="/#about">About Us</a></li>
                  <li><a class="block py-1.5" href="/#services">Services</a></li>
                  <li>
                    <a class="block py-1.5" href="/#contact">Contact Us</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#coupons">Pricing &amp; Coupons</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#estimate">Estimated</a>
                  </li>
                  <li>
                    <a class="block py-1.5" href="/#reviews">Testimonials</a>
                  </li>
                </ul>
              </details>
            </li>
            <li><a class="block py-3" href="/#parts">Spare Parts</a></li>
          </ul>
        </nav>
      </div>
    </header>
    """
  end

  @doc """
  Cart drawer plus the CartHook root that drives it.

  Cart state lives in localStorage (`assets/js/cart.js`); CartHook renders this
  drawer from it and keeps `#cart-count-badge` in sync. The element ids here are
  the contract with that hook — renaming one silently breaks the drawer.
  """
  def cart_drawer(assigns) do
    ~H"""
    <div id="cart-hook-root" phx-hook="CartHook" class="hidden"></div>

    <div
      id="cart-drawer-backdrop"
      class="pointer-events-none fixed inset-0 z-40 bg-black/40 opacity-0 backdrop-blur-sm transition-opacity duration-300"
      onclick="window.CartDrawer && window.CartDrawer.close()"
    >
    </div>

    <div
      id="cart-drawer"
      class="fixed right-0 top-0 z-50 flex h-full w-full max-w-sm flex-col bg-white shadow-2xl transition-transform duration-300 ease-out"
      style="transform: translateX(100%);"
    >
      <div class="flex items-center justify-between border-b border-line px-5 py-4">
        <div class="flex items-center gap-2">
          <svg
            class="h-5 w-5 text-brand"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <circle cx="9" cy="21" r="1" />
            <circle cx="20" cy="21" r="1" />
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
          </svg>
          <h2 class="font-display text-base font-extrabold text-ink">
            Your Cart (<span id="drawer-item-count">0</span>)
          </h2>
        </div>
        <button
          type="button"
          onclick="window.CartDrawer && window.CartDrawer.close()"
          class="p-1.5 text-mute transition hover:bg-line hover:text-ink"
          aria-label="Close cart"
        >
          <svg
            class="h-5 w-5"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <path d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>

      <div id="cart-drawer-items" class="flex-1 overflow-y-auto px-5 py-4">
        <div
          id="cart-drawer-empty"
          class="flex flex-col items-center justify-center py-16 text-center"
        >
          <svg
            class="h-14 w-14 text-line"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="1.5"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <circle cx="9" cy="21" r="1" />
            <circle cx="20" cy="21" r="1" />
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
          </svg>
          <p class="mt-4 text-[15px] font-medium text-ink">Your cart is empty</p>
          <p class="mt-1 text-[13px] text-mute">Add a part to get started</p>
        </div>
        <div id="cart-drawer-list" class="hidden space-y-4"></div>
      </div>

      <div id="cart-drawer-footer" class="hidden border-t border-line px-5 py-5">
        <div class="mb-4 flex justify-between text-[15px]">
          <span class="text-body">Subtotal</span>
          <span class="font-semibold text-ink">KES <span id="drawer-total">0</span></span>
        </div>
        <a
          href="/checkout"
          class="block w-full bg-brand py-3.5 text-center text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-ink"
        >
          Checkout
        </a>
        <a
          href="/cart"
          class="mt-2 block w-full border border-line py-3.5 text-center text-[13px] font-semibold uppercase tracking-wide text-ink transition hover:border-ink"
        >
          View Cart
        </a>
      </div>
    </div>
    """
  end

  @doc """
  Two-slide crossfading hero with headline and CTAs.
  """
  def hero(assigns) do
    ~H"""
    <section class="relative isolate min-h-[520px] overflow-hidden bg-ink lg:min-h-[680px]">
      <!-- Slide 1 -->
      <div class="hero-slide absolute inset-0">
        <img
          src="https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=1800&q=80&auto=format&fit=crop"
          alt=""
          aria-hidden="true"
          class="h-full w-full object-cover"
        />
        <div class="absolute inset-0 bg-gradient-to-r from-ink via-ink/85 to-ink/25"></div>
      </div>
      
    <!-- Slide 2 -->
      <div class="hero-slide hero-slide--2 absolute inset-0">
        <img
          src="https://images.unsplash.com/photo-1530046339160-ce3e530c7d2f?w=1800&q=80&auto=format&fit=crop"
          alt=""
          aria-hidden="true"
          class="h-full w-full object-cover"
        />
        <div class="absolute inset-0 bg-gradient-to-r from-ink via-ink/85 to-ink/25"></div>
      </div>

      <div class="relative mx-auto flex min-h-[520px] max-w-wrap items-center px-4 py-20 lg:min-h-[680px]">
        <div class="max-w-2xl">
          <p class="mb-5 inline-flex items-center gap-2 border-l-4 border-brand bg-white/5 py-1.5 pl-3 pr-4 text-[13px] font-semibold uppercase tracking-[0.2em] text-white">
            Umoja I · Nairobi, Kenya
          </p>
          <h1 class="font-display text-4xl font-extrabold leading-[1.08] text-white sm:text-5xl lg:text-6xl">
            Reliable Auto Repairs &amp; Quality Spare Parts.
          </h1>
          <p class="mt-6 max-w-xl text-lg text-white/70">
            Keeping Nairobi moving — one vehicle at a time. Repairs, servicing, diagnostics and quality spare parts for a wide range of makes and models.
          </p>

          <div class="mt-9 flex flex-wrap items-center gap-4">
            <a
              href="/#featured-parts"
              class="inline-flex items-center gap-2 bg-brand px-7 py-4 text-[14px] font-semibold uppercase tracking-wide text-white transition hover:bg-white hover:text-ink"
            >
              Shop Spare Parts
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <line x1="5" y1="12" x2="19" y2="12" />
                <polyline points="12 5 19 12 12 19" />
              </svg>
            </a>
            <a
              href="tel:+254724335924"
              class="inline-flex items-center gap-2 border border-white/30 px-7 py-4 text-[14px] font-semibold uppercase tracking-wide text-white transition hover:border-white hover:bg-white hover:text-ink"
            >
              Call Now
            </a>
            <a
              href="https://wa.me/254724335924"
              class="inline-flex items-center gap-2 border border-white/30 px-7 py-4 text-[14px] font-semibold uppercase tracking-wide text-white transition hover:border-white hover:bg-white hover:text-ink"
            >
              WhatsApp Us
            </a>
          </div>

          <div class="mt-10 flex flex-wrap items-center gap-x-3 gap-y-1 text-[14px] text-white/70">
            <strong class="font-semibold text-white">We work on</strong>
            <span>Toyota · Nissan · Mazda · Subaru · Honda · Mitsubishi</span>
          </div>
        </div>
      </div>

      <a
        href="#reasons"
        class="absolute bottom-6 left-1/2 hidden -translate-x-1/2 text-white/60 transition hover:text-white lg:block"
        aria-label="Scroll to content"
      >
        <svg
          class="h-8 w-8 motion-safe:animate-bounce"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          aria-hidden="true"
        >
          <line x1="12" y1="5" x2="12" y2="19" />
          <polyline points="19 12 12 19 5 12" />
        </svg>
      </a>
    </section>
    """
  end

  @doc """
  Five reasons to trust the shop.
  """
  def reasons(assigns) do
    ~H"""
    <section id="reasons" class="border-b border-line py-20">
      <div class="mx-auto max-w-wrap px-4">
        <h2 class="mb-12 text-center font-display text-3xl font-extrabold text-ink sm:text-4xl">
          Why Choose Dansun?
        </h2>

        <ul class="grid grid-cols-2 gap-px overflow-hidden rounded-sm bg-line sm:grid-cols-3 lg:grid-cols-5">
          <li class="group bg-white p-8 text-center transition hover:bg-ink">
            <svg
              class="mx-auto mb-5 h-10 w-10 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.75"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <circle cx="12" cy="12" r="10" />
              <path d="M8 14s1.5 2 4 2 4-2 4-2" />
              <line x1="9" y1="9" x2="9.01" y2="9" />
              <line x1="15" y1="9" x2="15.01" y2="9" />
            </svg>
            <h3 class="text-[15px] font-semibold text-ink transition group-hover:text-white">
              Experienced Mechanics
            </h3>
          </li>
          <li class="group bg-white p-8 text-center transition hover:bg-ink">
            <svg
              class="mx-auto mb-5 h-10 w-10 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.75"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <rect x="1" y="3" width="15" height="13" />
              <polygon points="16 8 20 8 23 11 23 16 16 16 16 8" />
              <circle cx="5.5" cy="18.5" r="2.5" />
              <circle cx="18.5" cy="18.5" r="2.5" />
            </svg>
            <h3 class="text-[15px] font-semibold text-ink transition group-hover:text-white">
              Quality Spare Parts
            </h3>
          </li>
          <li class="group bg-white p-8 text-center transition hover:bg-ink">
            <svg
              class="mx-auto mb-5 h-10 w-10 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.75"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4" />
            </svg>
            <h3 class="text-[15px] font-semibold text-ink transition group-hover:text-white">
              Fair Pricing
            </h3>
          </li>
          <li class="group bg-white p-8 text-center transition hover:bg-ink">
            <svg
              class="mx-auto mb-5 h-10 w-10 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.75"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
              <polyline points="9 22 9 12 15 12 15 22" />
            </svg>
            <h3 class="text-[15px] font-semibold text-ink transition group-hover:text-white">
              Convenient Location
            </h3>
          </li>
          <li class="group col-span-2 bg-white p-8 text-center transition hover:bg-ink sm:col-span-1">
            <svg
              class="mx-auto mb-5 h-10 w-10 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.75"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
            </svg>
            <h3 class="text-[15px] font-semibold text-ink transition group-hover:text-white">
              Parts Sourcing
            </h3>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  @doc """
  Service pillars / estimated-budget band.
  """
  def estimate(assigns) do
    ~H"""
    <section id="estimate" class="py-20">
      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-12 flex flex-wrap items-end justify-between gap-6">
          <h2 class="max-w-2xl font-display text-3xl font-extrabold leading-tight text-ink sm:text-4xl">
            Tell us what you need and we will advise on the next step.
          </h2>
          <a
            href="https://wa.me/254724335924"
            class="inline-flex items-center gap-2 bg-ink px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-brand"
          >
            WhatsApp Us
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </a>
        </div>

        <div class="grid gap-8 lg:grid-cols-4">
          <article class="group border border-line bg-white transition hover:border-brand hover:shadow-xl">
            <div class="aspect-[4/3] overflow-hidden bg-ink">
              <img
                src="https://images.unsplash.com/photo-1625047509168-a7026f36de04?w=1080&q=80&auto=format&fit=crop"
                alt="Technician performing a free vehicle inspection"
                loading="lazy"
                class="h-full w-full object-cover transition duration-500 group-hover:scale-105"
              />
            </div>
            <div class="p-7">
              <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
                Vehicle Diagnostics
              </h3>
              <p class="mb-5 text-[15px]">
                Not sure what is wrong? We inspect your vehicle and identify the problem before any repairs begin.
              </p>
              <a
                href="tel:+254724335924"
                class="inline-flex items-center gap-2 text-[13px] font-semibold uppercase tracking-wide text-brand transition hover:text-ink"
              >
                Book a Diagnostic
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <line x1="5" y1="12" x2="19" y2="12" />
                  <polyline points="12 5 19 12 12 19" />
                </svg>
              </a>
            </div>
          </article>

          <article class="group border border-line bg-white transition hover:border-brand hover:shadow-xl">
            <div class="aspect-[4/3] overflow-hidden bg-ink">
              <img
                src="https://images.unsplash.com/photo-1530046339160-ce3e530c7d2f?w=1080&q=80&auto=format&fit=crop"
                alt="Mechanic carrying out scheduled car maintenance"
                loading="lazy"
                class="h-full w-full object-cover transition duration-500 group-hover:scale-105"
              />
            </div>
            <div class="p-7">
              <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
                Vehicle Servicing
              </h3>
              <p class="mb-5 text-[15px]">
                Oil and filter changes, fluid top-ups, engine checks and preventive maintenance.
              </p>
              <a
                href="/#services"
                class="inline-flex items-center gap-2 text-[13px] font-semibold uppercase tracking-wide text-brand transition hover:text-ink"
              >
                Find out More
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <line x1="5" y1="12" x2="19" y2="12" />
                  <polyline points="12 5 19 12 12 19" />
                </svg>
              </a>
            </div>
          </article>

          <article class="group border border-line bg-white transition hover:border-brand hover:shadow-xl">
            <div class="aspect-[4/3] overflow-hidden bg-ink">
              <img
                src="https://images.unsplash.com/photo-1607603750909-408e193868c7?w=1080&q=80&auto=format&fit=crop"
                alt="Engine bay repair work in progress"
                loading="lazy"
                class="h-full w-full object-cover transition duration-500 group-hover:scale-105"
              />
            </div>
            <div class="p-7">
              <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
                Vehicle Repairs
              </h3>
              <p class="mb-5 text-[15px]">
                Engine, brakes, suspension, steering, cooling, clutch and battery work.
              </p>
              <a
                href="/#services"
                class="inline-flex items-center gap-2 text-[13px] font-semibold uppercase tracking-wide text-brand transition hover:text-ink"
              >
                Find out More
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <line x1="5" y1="12" x2="19" y2="12" />
                  <polyline points="12 5 19 12 12 19" />
                </svg>
              </a>
            </div>
          </article>
          
    <!-- Working hours card -->
          <aside class="flex flex-col justify-between bg-ink p-8 text-white">
            <div>
              <svg
                class="mb-6 h-10 w-10 text-brand"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.75"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
                <circle cx="12" cy="10" r="3" />
              </svg>
              <h3 class="mb-6 font-display text-xl font-extrabold">
                Working Hours
              </h3>
              <dl class="space-y-3 text-[15px]">
                <div class="flex justify-between border-b border-white/10 pb-3">
                  <dt class="text-white/60">Mon – Sat:</dt>
                  <dd class="font-medium">8:00 AM – 6:00 PM</dd>
                </div>
                <div class="flex justify-between border-b border-white/10 pb-3">
                  <dt class="text-white/60">Sunday:</dt>
                  <dd class="font-medium">Closed</dd>
                </div>
              </dl>
              <p class="mt-4 text-[13px] text-white/50">
                Closed on public holidays.
              </p>
            </div>
            <a
              href="/#contact"
              class="mt-8 inline-flex items-center justify-center gap-2 bg-brand px-5 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-white hover:text-ink"
            >
              Schedule Appointment
            </a>
          </aside>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Vehicle brands we service.
  """
  def brands(assigns) do
    ~H"""
    <section id="brands" class="border-y border-line bg-[#F7F7F7] py-14">
      <div class="mx-auto max-w-wrap px-4">
        <p class="mb-8 text-center text-[13px] font-semibold uppercase tracking-[0.2em] text-mute">
          Vehicle makes we regularly work on
        </p>
        <ul class="flex flex-wrap items-center justify-center gap-x-12 gap-y-6">
          <li>
            <a
              href="/#brands"
              class="font-display text-2xl font-extrabold uppercase tracking-[0.18em] text-mute transition hover:text-ink"
            >
              Nissan
            </a>
          </li>
          <li>
            <a
              href="/#brands"
              class="font-display text-2xl font-extrabold uppercase tracking-[0.18em] text-mute transition hover:text-ink"
            >
              Subaru
            </a>
          </li>
          <li>
            <a
              href="/#brands"
              class="font-display text-2xl font-extrabold uppercase tracking-[0.18em] text-mute transition hover:text-ink"
            >
              Mazda
            </a>
          </li>
          <li>
            <a
              href="/#brands"
              class="font-display text-2xl font-extrabold uppercase tracking-[0.18em] text-mute transition hover:text-ink"
            >
              Honda
            </a>
          </li>
          <li>
            <a
              href="/#brands"
              class="font-display text-2xl font-extrabold uppercase tracking-[0.18em] text-mute transition hover:text-ink"
            >
              Mitsubishi
            </a>
          </li>
          <li>
            <a
              href="/#brands"
              class="font-display text-2xl font-extrabold uppercase tracking-[0.18em] text-mute transition hover:text-ink"
            >
              Toyota
            </a>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  @doc """
  About the shop.
  """
  def about(assigns) do
    ~H"""
    <section id="about" class="py-24">
      <div class="mx-auto grid max-w-wrap items-center gap-14 px-4 lg:grid-cols-2">
        <div class="relative">
          <div class="aspect-[4/3] overflow-hidden bg-ink">
            <img
              src="https://images.unsplash.com/photo-1487754180451-c456f719a1fc?w=1400&q=80&auto=format&fit=crop"
              alt="The Dansun Auto Care workshop in Umoja I"
              loading="lazy"
              class="h-full w-full object-cover"
            />
          </div>
          <div class="absolute -bottom-8 -right-4 hidden bg-brand px-9 py-7 text-white sm:block lg:-right-8">
            <p class="font-display text-3xl font-extrabold leading-none">
              Umoja I
            </p>
            <p class="mt-1 text-[13px] uppercase tracking-widest text-white/80">
              Nairobi, Kenya
            </p>
          </div>
        </div>

        <div>
          <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            Dansun Auto Care
          </p>
          <h2 class="font-display text-4xl font-extrabold leading-tight text-ink sm:text-5xl">
            Umoja I, Nairobi.
          </h2>
          <p class="mt-6 max-w-xl text-lg">
            An automotive repair and spare parts business serving motorists in Umoja and the greater Nairobi area. Our focus is practical solutions — from regular servicing and repairs to helping you find the right spare part.
          </p>

          <ul class="mt-8 grid gap-4 sm:grid-cols-2">
            <li class="flex items-start gap-3">
              <svg
                class="mt-1 h-5 w-5 shrink-0 text-brand"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <polyline points="20 6 9 17 4 12" />
              </svg>
              <span class="text-[15px]">Experienced, hands-on mechanics</span>
            </li>
            <li class="flex items-start gap-3">
              <svg
                class="mt-1 h-5 w-5 shrink-0 text-brand"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <polyline points="20 6 9 17 4 12" />
              </svg>
              <span class="text-[15px]">Clear recommendations before work starts</span>
            </li>
            <li class="flex items-start gap-3">
              <svg
                class="mt-1 h-5 w-5 shrink-0 text-brand"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <polyline points="20 6 9 17 4 12" />
              </svg>
              <span class="text-[15px]">Spare parts sourced for most makes</span>
            </li>
            <li class="flex items-start gap-3">
              <svg
                class="mt-1 h-5 w-5 shrink-0 text-brand"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <polyline points="20 6 9 17 4 12" />
              </svg>
              <span class="text-[15px]">Straightforward, fair pricing</span>
            </li>
          </ul>

          <a
            href="/info/about-us"
            class="mt-10 inline-flex items-center gap-2 bg-ink px-7 py-4 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-brand"
          >
            Learn More About Us
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </a>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Service catalogue grid.
  """
  def services(assigns) do
    ~H"""
    <section id="services" class="bg-[#F7F7F7] py-24">
      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-14 flex flex-wrap items-end justify-between gap-6">
          <div>
            <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
              What We Offer
            </p>
            <h2 class="font-display text-3xl font-extrabold text-ink sm:text-4xl">
              Repairs, Servicing &amp; Spare Parts
            </h2>
            <p class="mt-4 max-w-xl text-[17px]">
              Repairs, routine servicing, diagnostics and quality spare parts for a wide range of vehicle makes and models.
            </p>
          </div>
          <a
            href="/collections"
            class="inline-flex items-center gap-2 bg-brand px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-ink"
          >
            Browse Spare Parts
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </a>
        </div>

        <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
          <article class="group relative border border-line bg-white p-9 transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl">
            <svg
              class="mb-6 h-11 w-11 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
            </svg>
            <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
              Engine Repairs
            </h3>
            <p class="text-[15px]">
              Engine diagnostics and repair, cooling system work and general mechanical repairs to get you running properly again.
            </p>
            <span
              class="mt-7 inline-flex h-10 w-10 items-center justify-center border border-line text-ink transition group-hover:border-brand group-hover:bg-brand group-hover:text-white"
              aria-hidden="true"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <line x1="12" y1="5" x2="12" y2="19" />
                <line x1="5" y1="12" x2="19" y2="12" />
              </svg>
            </span>
          </article>

          <article class="group relative border border-line bg-white p-9 transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl">
            <svg
              class="mb-6 h-11 w-11 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <rect x="1" y="6" width="18" height="12" rx="2" />
              <line x1="23" y1="10" x2="23" y2="14" />
              <line x1="6" y1="10" x2="6" y2="14" />
              <line x1="11" y1="10" x2="11" y2="14" />
            </svg>
            <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
              Brake Servicing
            </h3>
            <p class="text-[15px]">
              Brake pad replacement, disc and drum work, and inspection of the full braking system for safe stopping.
            </p>
            <span
              class="mt-7 inline-flex h-10 w-10 items-center justify-center border border-line text-ink transition group-hover:border-brand group-hover:bg-brand group-hover:text-white"
              aria-hidden="true"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <line x1="12" y1="5" x2="12" y2="19" />
                <line x1="5" y1="12" x2="19" y2="12" />
              </svg>
            </span>
          </article>

          <article class="group relative border border-line bg-white p-9 transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl">
            <svg
              class="mb-6 h-11 w-11 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <circle cx="12" cy="12" r="10" />
              <circle cx="12" cy="12" r="4" />
              <line x1="4.93" y1="4.93" x2="9.17" y2="9.17" />
              <line x1="14.83" y1="14.83" x2="19.07" y2="19.07" />
              <line x1="14.83" y1="9.17" x2="19.07" y2="4.93" />
              <line x1="4.93" y1="19.07" x2="9.17" y2="14.83" />
            </svg>
            <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
              Suspension &amp; Steering
            </h3>
            <p class="text-[15px]">
              Shocks, bushes, ball joints and steering repairs — for a stable, comfortable and safe ride.
            </p>
            <span
              class="mt-7 inline-flex h-10 w-10 items-center justify-center border border-line text-ink transition group-hover:border-brand group-hover:bg-brand group-hover:text-white"
              aria-hidden="true"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <line x1="12" y1="5" x2="12" y2="19" />
                <line x1="5" y1="12" x2="19" y2="12" />
              </svg>
            </span>
          </article>

          <article class="group relative border border-line bg-white p-9 transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl">
            <svg
              class="mb-6 h-11 w-11 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M3 15h18M5 15l1.6-5.2A2 2 0 0 1 8.5 8.4h7a2 2 0 0 1 1.9 1.4L19 15v4h-3v-2H8v2H5z" />
              <circle cx="7.5" cy="17" r="0.6" />
              <circle cx="16.5" cy="17" r="0.6" />
            </svg>
            <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
              Vehicle Servicing
            </h3>
            <p class="text-[15px]">
              Oil and filter changes, air and fuel filters, fluid checks and top-ups, and preventive maintenance.
            </p>
            <span
              class="mt-7 inline-flex h-10 w-10 items-center justify-center border border-line text-ink transition group-hover:border-brand group-hover:bg-brand group-hover:text-white"
              aria-hidden="true"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <line x1="12" y1="5" x2="12" y2="19" />
                <line x1="5" y1="12" x2="19" y2="12" />
              </svg>
            </span>
          </article>

          <article class="group relative border border-line bg-white p-9 transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl">
            <svg
              class="mb-6 h-11 w-11 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
            </svg>
            <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
              Vehicle Diagnostics
            </h3>
            <p class="text-[15px]">
              Warning light checks, electrical fault diagnosis and performance troubleshooting before any repair begins.
            </p>
            <span
              class="mt-7 inline-flex h-10 w-10 items-center justify-center border border-line text-ink transition group-hover:border-brand group-hover:bg-brand group-hover:text-white"
              aria-hidden="true"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <line x1="12" y1="5" x2="12" y2="19" />
                <line x1="5" y1="12" x2="19" y2="12" />
              </svg>
            </span>
          </article>

          <article class="group relative border border-line bg-white p-9 transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl">
            <svg
              class="mb-6 h-11 w-11 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <circle cx="12" cy="12" r="9" />
              <circle cx="12" cy="12" r="3.2" />
              <line x1="12" y1="3" x2="12" y2="8.8" />
              <line x1="12" y1="15.2" x2="12" y2="21" />
              <line x1="3" y1="12" x2="8.8" y2="12" />
              <line x1="15.2" y1="12" x2="21" y2="12" />
            </svg>
            <h3 class="mb-3 font-display text-xl font-extrabold text-ink">
              Spare Parts
            </h3>
            <p class="text-[15px]">
              Brake pads, filters, spark plugs, belts, batteries, suspension and engine components — sourced for most makes.
            </p>
            <span
              class="mt-7 inline-flex h-10 w-10 items-center justify-center border border-line text-ink transition group-hover:border-brand group-hover:bg-brand group-hover:text-white"
              aria-hidden="true"
            >
              <svg
                class="h-4 w-4"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <line x1="12" y1="5" x2="12" y2="19" />
                <line x1="5" y1="12" x2="19" y2="12" />
              </svg>
            </span>
          </article>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Spare parts: what we stock, and how to ask about a part we don't.
  """
  def parts(assigns) do
    ~H"""
    <section id="parts" class="py-24">
      <div class="mx-auto grid max-w-wrap gap-14 px-4 lg:grid-cols-2 lg:items-start">
        <div>
          <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            Spare Parts
          </p>
          <h2 class="font-display text-3xl font-extrabold text-ink sm:text-4xl">
            Find the right part for your vehicle.
          </h2>
          <p class="mt-4 max-w-xl text-[17px]">
            Dansun Auto Care supplies and sources spare parts for different
            vehicle makes and models. Common parts we handle:
          </p>

          <ul class="mt-8 grid grid-cols-2 gap-x-6 gap-y-3 text-[15px] sm:grid-cols-3">
            <li
              :for={
                part <- [
                  "Brake pads",
                  "Oil filters",
                  "Air filters",
                  "Fuel filters",
                  "Spark plugs",
                  "Belts",
                  "Suspension components",
                  "Batteries",
                  "Engine components"
                ]
              }
              class="flex items-start gap-2"
            >
              <span class="mt-2 h-1.5 w-1.5 shrink-0 bg-brand" aria-hidden="true"></span>
              {part}
            </li>
          </ul>

          <a
            href="/collections"
            class="mt-10 inline-flex items-center gap-2 bg-brand px-7 py-4 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-ink"
          >
            Browse Spare Parts
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </a>
        </div>

        <div class="border border-line bg-[#F7F7F7] p-9">
          <h3 class="font-display text-2xl font-extrabold text-ink">
            Can&#8217;t find your part?
          </h3>
          <p class="mt-3 text-[15px]">
            Send us these details and our team will help you identify the
            correct part and confirm availability.
          </p>
          <ol class="mt-7 space-y-3 text-[15px]">
            <li
              :for={
                {label, index} <-
                  Enum.with_index(
                    [
                      "Vehicle make",
                      "Vehicle model",
                      "Year",
                      "Part name or part number",
                      "Photo of the part, where possible"
                    ],
                    1
                  )
              }
              class="flex items-start gap-3"
            >
              <span class="grid h-6 w-6 shrink-0 place-items-center bg-brand text-[12px] font-bold text-white">
                {index}
              </span>
              {label}
            </li>
          </ol>
          <div class="mt-8 flex flex-wrap gap-3">
            <a
              href="https://wa.me/254724335924"
              class="inline-flex items-center gap-2 bg-brand px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-ink"
            >
              Ask About a Spare Part
            </a>
            <a
              href="tel:+254724335924"
              class="inline-flex items-center gap-2 border border-ink px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-ink transition hover:bg-ink hover:text-white"
            >
              Call +254 724 335924
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr :collections, :list, required: true

  @doc """
  Shop by part category. Each tile links into the existing category page.
  """
  def part_categories(assigns) do
    ~H"""
    <section :if={@collections != []} id="shop" class="border-b border-line py-24">
      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-14 flex flex-wrap items-end justify-between gap-6">
          <div>
            <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
              Shop
            </p>
            <h2 class="font-display text-3xl font-extrabold text-ink sm:text-4xl">
              Browse parts by category
            </h2>
          </div>
          <.link
            navigate="/collections"
            class="inline-flex items-center gap-2 text-[13px] font-semibold uppercase tracking-wide text-brand transition hover:text-ink"
          >
            All Categories
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </.link>
        </div>

        <ul class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          <li :for={collection <- @collections}>
            <.link navigate={collection.href} class="group block">
              <div class="relative aspect-[4/3] overflow-hidden bg-ink">
                <img
                  src={collection.image}
                  alt={collection.name}
                  loading="lazy"
                  class="h-full w-full object-cover opacity-70 transition duration-500 group-hover:scale-105 group-hover:opacity-90"
                />
                <div class="absolute inset-0 bg-gradient-to-t from-ink via-ink/20 to-transparent">
                </div>
                <div class="absolute inset-x-0 bottom-0 p-6">
                  <h3 class="font-display text-xl font-extrabold text-white">
                    {collection.name}
                  </h3>
                  <p class="mt-1 text-[13px] uppercase tracking-widest text-white/70">
                    {collection.item_count} {if collection.item_count == 1, do: "part", else: "parts"}
                  </p>
                </div>
              </div>
            </.link>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  attr :products, :list, required: true
  attr :eyebrow, :string, default: "In Stock"
  attr :title, :string, default: "Parts ready to go"
  attr :id, :string, default: "featured-parts"
  attr :class, :string, default: ""

  @doc """
  Product grid with prices and add-to-cart.

  The add button carries the cart payload as JSON on `data-product` and is
  driven by the AddSingleToCart hook, matching the rest of the storefront.
  """
  def part_grid(assigns) do
    ~H"""
    <section :if={@products != []} id={@id} class={["py-24", @class]}>
      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-14 flex flex-wrap items-end justify-between gap-6">
          <div>
            <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
              {@eyebrow}
            </p>
            <h2 class="font-display text-3xl font-extrabold text-ink sm:text-4xl">
              {@title}
            </h2>
          </div>
          <.link
            navigate="/collections"
            class="inline-flex items-center gap-2 bg-brand px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-ink"
          >
            Shop All Parts
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </.link>
        </div>

        <ul class="grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
          <li
            :for={product <- @products}
            class="group flex flex-col border border-line bg-white transition hover:-translate-y-1 hover:border-brand hover:shadow-2xl"
          >
            <.link navigate={product.href} class="block">
              <div class="relative aspect-square overflow-hidden bg-[#F7F7F7]">
                <img
                  src={product.main_image}
                  alt={product.name}
                  loading="lazy"
                  class="h-full w-full object-cover transition duration-500 group-hover:scale-105"
                />
                <span
                  :if={product.badge}
                  class="absolute left-0 top-4 bg-brand px-3 py-1 text-[11px] font-semibold uppercase tracking-widest text-white"
                >
                  {product.badge}
                </span>
              </div>
            </.link>

            <div class="flex flex-1 flex-col p-6">
              <.link navigate={product.href} class="block">
                <h3 class="font-display text-[17px] font-extrabold leading-snug text-ink transition group-hover:text-brand">
                  {product.name}
                </h3>
              </.link>
              <p class="mt-3 font-display text-xl font-extrabold text-brand">
                {product.currency} {format_price(product.price)}
              </p>

              <button
                type="button"
                id={"add-to-cart-#{product.id}"}
                phx-hook="AddSingleToCart"
                data-product={cart_payload(product)}
                class="mt-auto w-full border border-ink px-5 py-3 pt-3 text-[13px] font-semibold uppercase tracking-wide text-ink transition hover:bg-ink hover:text-white"
              >
                Add to Cart
              </button>
            </div>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  attr :bundle, :map, default: nil

  @doc """
  The active bundle — one click adds every part in it to the cart.
  """
  def service_kit(assigns) do
    ~H"""
    <section :if={@bundle} id="service-kit" class="bg-ink py-24 text-white">
      <div class="mx-auto grid max-w-wrap items-center gap-14 px-4 lg:grid-cols-2">
        <div class="relative">
          <img
            src={@bundle.image}
            alt={@bundle.title}
            loading="lazy"
            class="aspect-[4/3] w-full object-cover"
          />
          <p class="absolute -bottom-5 left-6 bg-brand px-6 py-3 font-display text-[13px] font-extrabold uppercase tracking-widest">
            Save when you buy the kit
          </p>
        </div>

        <div>
          <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            Bundle
          </p>
          <h2 class="font-display text-3xl font-extrabold sm:text-4xl">
            {@bundle.title}
          </h2>
          <p class="mt-5 max-w-lg text-[17px] text-white/70">
            {@bundle.description}
          </p>

          <ul
            :if={@bundle.products != []}
            class="mt-8 divide-y divide-white/10 border-y border-white/10"
          >
            <li
              :for={product <- @bundle.products}
              class="flex items-center justify-between gap-4 py-3.5"
            >
              <span class="text-[15px]">{product.name}</span>
              <span class="shrink-0 font-semibold">
                {product.currency} {format_price(product.price)}
              </span>
            </li>
          </ul>

          <p :if={@bundle.products != []} class="mt-6 flex items-baseline gap-3">
            <span class="text-[13px] uppercase tracking-widest text-white/60">Kit total</span>
            <span class="font-display text-3xl font-extrabold text-brand">
              KES {format_price(bundle_total(@bundle.products))}
            </span>
          </p>

          <button
            :if={@bundle.products != []}
            type="button"
            id="add-service-kit"
            phx-hook="AddBundleToCart"
            data-products={cart_payload(@bundle.products)}
            class="mt-9 inline-flex items-center gap-2 bg-brand px-7 py-4 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-white hover:text-ink"
          >
            Add Kit to Cart
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="5" y1="12" x2="19" y2="12" />
              <polyline points="12 5 19 12 12 19" />
            </svg>
          </button>
        </div>
      </div>
    </section>
    """
  end

  # ── Helpers ────────────────────────────────────────────────────────────────

  # Thousands-separated, no decimals — part prices are whole shillings.
  defp format_price(amount) do
    amount
    |> trunc()
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.map_join(",", &Enum.join/1)
    |> String.reverse()
  end

  defp bundle_total(products), do: Enum.reduce(products, 0, &(&1.price + &2))

  # The shape assets/js/cart.js expects for a cart line.
  defp cart_payload(products) when is_list(products) do
    products |> Enum.map(&cart_item/1) |> Jason.encode!()
  end

  defp cart_payload(product), do: product |> cart_item() |> Jason.encode!()

  defp cart_item(product) do
    %{
      id: product.id,
      slug: product.slug,
      name: product.name,
      image: product.main_image,
      price: product.price
    }
  end

  @doc """
  Frequently asked questions.
  """
  def faq(assigns) do
    assigns =
      assign(assigns, :items, [
        {"Do you sell spare parts?",
         "Yes. Dansun supplies and sources spare parts for different vehicle makes and models. Contact the shop to confirm current availability."},
        {"How do I ask for a specific spare part?",
         "Send the vehicle make, model, year, and the name or part number of the component. A photo can also help identify the correct part."},
        {"Do you repair vehicles?",
         "Yes. Dansun Auto Care provides automotive repair and maintenance services, including servicing and diagnostics."},
        {"Where are you located?", "Dansun Auto Care is located in Umoja I, Nairobi, Kenya."},
        {"Can I contact you through WhatsApp?",
         "Yes. Use the business number +254 724 335924 to enquire about services and spare parts."}
      ])

    ~H"""
    <section id="faq" class="bg-[#F7F7F7] py-24">
      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-12 text-center">
          <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            FAQ
          </p>
          <h2 class="font-display text-3xl font-extrabold text-ink sm:text-4xl">
            Questions we get asked a lot
          </h2>
        </div>

        <div class="mx-auto max-w-3xl divide-y divide-line border border-line bg-white">
          <details :for={{question, answer} <- @items} class="group px-7">
            <summary class="flex cursor-pointer list-none items-center justify-between gap-4 py-6 font-display text-[17px] font-extrabold text-ink transition group-open:text-brand">
              {question}
              <svg
                class="h-5 w-5 shrink-0 transition group-open:rotate-180"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <polyline points="6 9 12 15 18 9" />
              </svg>
            </summary>
            <p class="pb-6 text-[15px]">{answer}</p>
          </details>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Three-step how-it-works band.
  """
  def steps(assigns) do
    ~H"""
    <section id="steps" class="relative isolate overflow-hidden bg-ink py-24 text-white">
      <img
        src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=1800&q=80&auto=format&fit=crop"
        alt=""
        aria-hidden="true"
        loading="lazy"
        class="absolute inset-0 -z-10 h-full w-full object-cover opacity-20"
      />

      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-16 text-center">
          <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            How it works
          </p>
          <h2 class="font-display text-3xl font-extrabold sm:text-4xl">
            Three steps to getting back on the road.
          </h2>
        </div>

        <ol class="grid gap-10 md:grid-cols-3">
          <li class="relative text-center">
            <span class="mx-auto mb-6 grid h-20 w-20 place-items-center rounded-full border-2 border-brand text-brand">
              <svg
                class="h-9 w-9"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.6"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" />
              </svg>
            </span>
            <h3 class="mb-3 font-display text-xl font-extrabold">
              1. Contact Us
            </h3>
            <p class="mx-auto max-w-xs text-[15px] text-white/65">
              Call or WhatsApp us with your vehicle make, model and year, and the problem or part you need.
            </p>
          </li>
          <li class="relative text-center">
            <span class="mx-auto mb-6 grid h-20 w-20 place-items-center rounded-full border-2 border-brand text-brand">
              <svg
                class="h-9 w-9"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.6"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
              </svg>
            </span>
            <h3 class="mb-3 font-display text-xl font-extrabold">
              2. Get Assistance
            </h3>
            <p class="mx-auto max-w-xs text-[15px] text-white/65">
              We advise on the next step — inspection, repair, or whether the spare part is available.
            </p>
          </li>
          <li class="relative text-center">
            <span class="mx-auto mb-6 grid h-20 w-20 place-items-center rounded-full border-2 border-brand text-brand">
              <svg
                class="h-9 w-9"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.6"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
              >
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                <polyline points="22 4 12 14.01 9 11.01" />
              </svg>
            </span>
            <h3 class="mb-3 font-display text-xl font-extrabold">
              3. Visit the Garage
            </h3>
            <p class="mx-auto max-w-xs text-[15px] text-white/65">
              Bring your vehicle to our Umoja I workshop and drive away running properly and safely.
            </p>
          </li>
        </ol>
      </div>
    </section>
    """
  end

  @doc """
  Four buying promises — the parts-shop counterpart to a generic
  "free shipping / free returns" retail strip.
  """
  def promises(assigns) do
    ~H"""
    <section class="border-y border-line bg-[#F7F7F7] py-16">
      <ul class="mx-auto grid max-w-wrap gap-10 px-4 sm:grid-cols-2 lg:grid-cols-4">
        <li
          :for={
            {title, copy, path} <- [
              {"Genuine &amp; OEM Parts", "Sourced from trusted suppliers",
               "M9 12l2 2 4-4M12 3l7 4v5c0 5-3.5 8-7 9-3.5-1-7-4-7-9V7z"},
              {"Fitting At Our Garage", "Buy the part, we install it",
               "M14.7 6.3a4 4 0 01-5 5L4 17v3h3l5.7-5.7a4 4 0 015-5l2-2-3-3-2 2z"},
              {"Pay On Delivery or M-Pesa", "Whatever is easiest for you",
               "M2 7h20v10a2 2 0 01-2 2H4a2 2 0 01-2-2V7zm0 4h20M6 15h4"},
              {"Can&#8217;t Find It? We Source It", "Send the details, we&#8217;ll hunt it down",
               "M11 19a8 8 0 100-16 8 8 0 000 16zm10 2l-4.35-4.35"}
            ]
          }
          class="text-center"
        >
          <svg
            class="mx-auto mb-4 h-9 w-9 text-brand"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="1.75"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <path d={path} />
          </svg>
          <h3 class="font-display text-[16px] font-extrabold uppercase tracking-wide text-ink">
            {Phoenix.HTML.raw(title)}
          </h3>
          <p class="mt-1.5 text-[14px]">{Phoenix.HTML.raw(copy)}</p>
        </li>
      </ul>
    </section>
    """
  end

  @doc """
  Full-bleed coupon banner.
  """
  def coupons(assigns) do
    ~H"""
    <section id="coupons" class="relative isolate overflow-hidden bg-brand">
      <img
        src="https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=1800&q=80&auto=format&fit=crop"
        alt=""
        aria-hidden="true"
        loading="lazy"
        class="absolute inset-0 -z-10 h-full w-full object-cover opacity-15"
      />

      <div class="mx-auto flex max-w-wrap flex-wrap items-center justify-between gap-8 px-4 py-16 text-white">
        <div>
          <p class="text-[13px] font-semibold uppercase tracking-[0.2em] text-white/70">
            Car trouble? Need a spare part?
          </p>
          <p class="mt-3 font-display text-4xl font-extrabold sm:text-5xl">
            Talk to Dansun today
          </p>
        </div>
        <a
          href="tel:+254724335924"
          class="inline-flex items-center gap-2 bg-white px-8 py-4 text-[13px] font-semibold uppercase tracking-wide text-ink transition hover:bg-ink hover:text-white"
        >
          Call +254 724 335924
          <svg
            class="h-4 w-4"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <line x1="5" y1="12" x2="19" y2="12" />
            <polyline points="12 5 19 12 12 19" />
          </svg>
        </a>
      </div>
    </section>
    """
  end

  attr :testimonials, :list,
    required: true,
    doc: "Testimonial records from the DB. The section hides itself when empty."

  @doc """
  Customer reviews. Driven by the testimonials the admin has entered — the
  reference template's hard-coded quotes were placeholder copy.
  """
  def testimonials(assigns) do
    ~H"""
    <section :if={@testimonials != []} id="reviews" class="py-24">
      <div class="mx-auto max-w-wrap px-4">
        <div class="mb-14 flex flex-wrap items-end justify-between gap-6">
          <h2 class="font-display text-3xl font-extrabold text-ink sm:text-4xl">
            What our customers say
          </h2>
        </div>

        <div class="grid gap-8 lg:grid-cols-3">
          <figure
            :for={testimonial <- @testimonials}
            class="flex h-full flex-col border border-line bg-white p-9 transition hover:border-brand hover:shadow-xl"
          >
            <svg
              class="mb-6 h-9 w-9 text-line"
              viewBox="0 0 24 24"
              fill="currentColor"
              aria-hidden="true"
            >
              <path d="M9.5 5C6.5 6.6 4.6 9.4 4.6 12.9V19h6.6v-6.4H8c.1-1.7.9-3 2.4-3.9L9.5 5zm9.6 0c-3 1.6-4.9 4.4-4.9 7.9V19h6.6v-6.4h-3.2c.1-1.7.9-3 2.4-3.9L19.1 5z" />
            </svg>
            <blockquote class="flex-1 font-serif text-[15px] italic leading-relaxed text-ink/85">
              {testimonial.body}
            </blockquote>
            <figcaption class="mt-7 flex items-center gap-3 border-t border-line pt-6">
              <span
                class="grid h-11 w-11 shrink-0 place-items-center rounded-full bg-ink font-display text-sm font-extrabold text-white"
                aria-hidden="true"
              >
                {initials(testimonial.name)}
              </span>
              <div>
                <p class="font-semibold text-ink">{testimonial.name}</p>
                <div
                  :if={testimonial.rating}
                  class="mt-0.5 flex text-brand"
                  role="img"
                  aria-label={"Rated #{testimonial.rating} out of 5"}
                >
                  <svg
                    :for={_ <- 1..testimonial.rating//1}
                    class="h-3.5 w-3.5"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                    aria-hidden="true"
                  >
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                  </svg>
                </div>
              </div>
            </figcaption>
          </figure>
        </div>

        <div class="mt-12 flex flex-wrap items-center justify-center gap-6 border border-line bg-[#F7F7F7] px-8 py-7 text-center">
          <p class="font-display text-lg font-extrabold text-ink">
            Dansun Auto Care &#183; Umoja I, Nairobi
          </p>
          <a
            href="https://wa.me/254724335924"
            class="inline-flex items-center gap-2 border border-ink px-5 py-2.5 text-[13px] font-semibold uppercase tracking-wide text-ink transition hover:bg-ink hover:text-white"
          >
            WhatsApp Us
          </a>
        </div>
      </div>
    </section>
    """
  end

  defp initials(name) do
    name
    |> String.split(~r/\s+/, trim: true)
    |> Enum.take(2)
    |> Enum.map_join("", &String.first/1)
    |> String.upcase()
  end

  @doc """
  Contact form and showroom details.
  """
  def contact(assigns) do
    ~H"""
    <section id="contact" class="relative isolate overflow-hidden bg-ink py-24 text-white">
      <img
        src="https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=1800&q=80&auto=format&fit=crop"
        alt=""
        aria-hidden="true"
        loading="lazy"
        class="absolute inset-0 -z-10 h-full w-full object-cover opacity-15"
      />

      <div class="mx-auto grid max-w-wrap items-center gap-14 px-4 lg:grid-cols-2">
        <div>
          <p class="mb-3 text-[13px] font-semibold uppercase tracking-[0.2em] text-brand">
            Dansun Auto Care
          </p>
          <h2 class="font-display text-4xl font-extrabold leading-tight sm:text-5xl">
            Talk to us today.
          </h2>
          <p class="mt-6 max-w-lg text-lg text-white/70">
            Car trouble, or hunting for a spare part? Call or WhatsApp us with your vehicle details and we will tell you exactly what to do next.
          </p>
        </div>

        <div class="grid gap-6 sm:grid-cols-2">
          <div class="border border-white/15 bg-white/5 p-7">
            <svg
              class="mb-5 h-9 w-9 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.6"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.13.96.36 1.9.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.9.34 1.85.57 2.81.7A2 2 0 0 1 22 16.92z" />
            </svg>
            <h3 class="mb-3 font-display text-lg font-extrabold">
              Customer Support
            </h3>
            <p>
              <a href="tel:+254724335924" class="text-white/75 transition hover:text-brand">
                +254 724 335924
              </a>
            </p>
            <p>
              <a href="https://wa.me/254724335924" class="text-white/75 transition hover:text-brand">
                WhatsApp us
              </a>
            </p>
          </div>
          <div class="border border-white/15 bg-white/5 p-7">
            <svg
              class="mb-5 h-9 w-9 text-brand"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.6"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
              <circle cx="12" cy="10" r="3" />
            </svg>
            <h3 class="mb-3 font-display text-lg font-extrabold">
              Visit the Garage
            </h3>
            <address class="not-italic text-white/75">
              Umoja I<br />Nairobi, Kenya
            </address>
          </div>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Site footer.
  """
  def footer(assigns) do
    ~H"""
    <footer class="bg-[#1E1E1E] text-white/70">
      <div class="mx-auto grid max-w-wrap gap-12 px-4 py-20 md:grid-cols-2 lg:grid-cols-4">
        <div>
          <a href="/" class="mb-6 flex items-center gap-3">
            <img
              src="/images/dansunauto-logo.png"
              alt="Dansun Auto Care"
              class="h-10 w-10 rounded-[10px] object-cover"
            />
            <span class="leading-none">
              <span class="block font-display text-2xl font-black uppercase tracking-tight text-white">
                Dansun Auto <span class="text-brand">Care</span>
              </span>
              <span class="mt-1 block text-[10px] font-medium uppercase tracking-[0.28em] text-white/50">
                Repairs &ndash; Servicing &ndash; Spare Parts
              </span>
            </span>
          </a>
          <p class="mb-6 text-[15px]">
            Automotive repair and spare parts for motorists in Umoja and the greater Nairobi area.
          </p>
          <ul class="flex gap-3">
            <li>
              <a
                href="/"
                class="grid h-10 w-10 place-items-center border border-white/15 transition hover:border-brand hover:bg-brand hover:text-white"
                aria-label="Dansunauto on Facebook"
              >
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z" />
                </svg>
              </a>
            </li>
            <li>
              <a
                href="/"
                class="grid h-10 w-10 place-items-center border border-white/15 transition hover:border-brand hover:bg-brand hover:text-white"
                aria-label="Dansunauto on Twitter"
              >
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z" />
                </svg>
              </a>
            </li>
            <li>
              <a
                href="/"
                class="grid h-10 w-10 place-items-center border border-white/15 transition hover:border-brand hover:bg-brand hover:text-white"
                aria-label="Dansunauto on Instagram"
              >
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <rect x="2" y="2" width="20" height="20" rx="5" />
                  <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
                  <line x1="17.5" y1="6.5" x2="17.51" y2="6.5" />
                </svg>
              </a>
            </li>
            <li>
              <a
                href="/"
                class="grid h-10 w-10 place-items-center border border-white/15 transition hover:border-brand hover:bg-brand hover:text-white"
                aria-label="Dansunauto on YouTube"
              >
                <svg
                  class="h-4 w-4"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z" />
                  <polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02" />
                </svg>
              </a>
            </li>
          </ul>
        </div>

        <div>
          <h2 class="mb-6 text-[16px] font-semibold uppercase tracking-wide text-white">
            Services
          </h2>
          <ul class="space-y-2.5 text-[15px]">
            <li>
              <a href="/#services" class="transition hover:text-brand">Engine Repairs</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">Brake Servicing</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">Suspension &amp; Steering</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">Clutch Repairs</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">Oil &amp; Filter Changes</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">Vehicle Diagnostics</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">Battery Replacement</a>
            </li>
            <li>
              <a href="/#services" class="transition hover:text-brand">General Servicing</a>
            </li>
          </ul>
        </div>

        <div>
          <h2 class="mb-6 text-[16px] font-semibold uppercase tracking-wide text-white">
            Quick links
          </h2>
          <ul class="space-y-2.5 text-[15px]">
            <li>
              <a href="/info/about-us" class="transition hover:text-brand">About Us</a>
            </li>
            <li>
              <a href="/collections" class="transition hover:text-brand">Spare Parts</a>
            </li>
            <li>
              <a href="/#faq" class="transition hover:text-brand">FAQ</a>
            </li>
            <li>
              <a href="/cart" class="transition hover:text-brand">My cart</a>
            </li>
            <li>
              <a href="/#contact" class="transition hover:text-brand">Contact Us</a>
            </li>
            <li>
              <a href="/#parts" class="transition hover:text-brand">Request a Part</a>
            </li>
            <li>
              <a href="/#brands" class="transition hover:text-brand">Vehicle Makes</a>
            </li>
            <li>
              <a href="/#steps" class="transition hover:text-brand">How It Works</a>
            </li>
          </ul>
        </div>

        <div>
          <h2 class="mb-6 text-[16px] font-semibold uppercase tracking-wide text-white">
            Get in Touch
          </h2>
          <address class="mb-5 not-italic text-[15px]">
            Umoja I, Nairobi, Kenya<br />Mon &#8211; Sat: 8:00 AM &#8211; 6:00 PM
          </address>
          <div class="flex flex-col gap-3">
            <a
              href="tel:+254724335924"
              class="inline-flex items-center justify-center gap-2 bg-brand px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:bg-white hover:text-ink"
            >
              Call +254 724 335924
            </a>
            <a
              href="https://wa.me/254724335924"
              class="inline-flex items-center justify-center gap-2 border border-white/20 px-6 py-3.5 text-[13px] font-semibold uppercase tracking-wide text-white transition hover:border-white hover:bg-white hover:text-ink"
            >
              WhatsApp Us
            </a>
          </div>
        </div>
      </div>

      <div class="border-t border-white/10">
        <div class="mx-auto flex max-w-wrap flex-wrap items-center justify-between gap-4 px-4 py-6 text-[14px]">
          <p>Copyright © 2026 Dansun Auto Care. All rights reserved.</p>
          <a href="/" class="inline-flex items-center gap-2 transition hover:text-brand">
            Go to Top
            <svg
              class="h-4 w-4"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
            >
              <line x1="12" y1="19" x2="12" y2="5" />
              <polyline points="5 12 12 5 19 12" />
            </svg>
          </a>
        </div>
      </div>
    </footer>
    """
  end

  @doc """
  Fixed back-to-top button.
  """
  def back_to_top(assigns) do
    ~H"""
    <a
      href="#top"
      class="fixed bottom-6 right-6 z-50 grid h-12 w-12 place-items-center bg-brand text-white shadow-lg transition hover:bg-ink"
      aria-label="Back to top"
    >
      <svg
        class="h-5 w-5"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
        aria-hidden="true"
      >
        <line x1="12" y1="19" x2="12" y2="5" />
        <polyline points="5 12 12 5 19 12" />
      </svg>
    </a>
    """
  end
end
