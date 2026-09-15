# Dansun Auto Care

Storefront and admin panel for **Dansun Auto Care** — an auto garage and spare parts shop in Umoja I, Nairobi. Customers browse and buy spare parts online; the shop runs orders, catalogue, promotions and customer chat from the admin panel. Built with [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view) and [Ecto](https://hexdocs.pm/ecto).

Marketing copy and the service/parts list live in [`dansun-auto-garage-content.md`](dansun-auto-garage-content.md) — treat it as the source of truth for storefront wording.

---

## Tech Stack

| Layer        | Technology                            |
|--------------|---------------------------------------|
| Framework    | [Phoenix](https://phoenixframework.org) 1.7 (Elixir) |
| UI           | Phoenix LiveView + Tailwind CSS       |
| Database     | PostgreSQL via Ecto                   |
| Payments     | Paystack                              |
| Email        | Nexus API (custom branded HTML)       |
| Charts       | Chart.js (admin dashboard)            |
| File Uploads | Local filesystem (`priv/static/uploads`) |

---

## Getting Started

### Prerequisites

- Elixir ≥ 1.15
- Erlang/OTP ≥ 26
- PostgreSQL

### Setup

```bash
# Installs deps, creates + migrates the DB, runs priv/repo/seeds.exs, builds assets
mix setup

# Start the dev server
mix phx.server
```

Visit [http://localhost:4000](http://localhost:4000) for the storefront and [http://localhost:4000/admin](http://localhost:4000/admin) for the admin panel.

`mix setup` already seeds the catalogue. To reseed from scratch later, `mix ecto.reset` (drops the database) or rerun `mix run priv/repo/seeds.exs` — the seed script clears its own tables first, so it is safe to re-run.

### Creating the first admin

Public registration is disabled: `/users/register` redirects to the log-in page, and further team members are invited from **Admin → Team**. Create the first `super_admin` by hand:

```elixir
# iex -S mix
{:ok, user} =
  Dansunauto.Accounts.invite_user(%{
    email: "you@example.com",
    name: "Your Name",
    password: "a-long-password",
    role: "super_admin"
  })
```

Then log in at `/users/log_in`. See **Admin → Help & Reference** inside the panel for a guide to every section.

---

## Environment Configuration

Overridable at runtime:

| Variable      | Default                        | Purpose                              |
|---------------|--------------------------------|--------------------------------------|
| `DATABASE_URL` | (set in `dev.exs`)            | PostgreSQL connection string         |
| `SECRET_KEY_BASE` | (generated)                | Phoenix secret key                   |
| `PHX_HOST`    | `dansunauto.com`               | Production hostname                  |
| `SITE_URL`    | `https://dansunauto.com`       | Absolute base URL for emails, canonical URLs & OG tags |
| `ADMIN_EMAIL` | `dansunautocloset@gmail.com`   | Recipient for admin order alerts     |
| `PAYSTACK_SECRET_KEY` | —                      | Paystack secret key (server-side)    |
| `PAYSTACK_PUBLIC_KEY` | —                      | Paystack public key (client-side)    |
| `NEXUS_API_KEY` | —                            | Nexus transactional email API key    |

---

## Design System

The storefront and admin share one set of tokens, defined in [`assets/tailwind.config.js`](assets/tailwind.config.js):

| Token    | Value     | Use                                  |
|----------|-----------|--------------------------------------|
| `brand`  | `#BB0A07` | Primary red — CTAs, active nav, accents |
| `ink`    | `#2A2A2A` | Headings and primary text            |
| `body`   | `#57575A` | Body copy                            |
| `line`   | `#E9E9E9` | Borders and dividers                 |
| `mute`   | `#B9BBBC` | Secondary text, placeholders, icons  |

Headings use `font-display` (Saira Condensed, uppercase); body copy uses `font-sans` (Barlow). Page sections sit on `#f9f9f7` or `#f5f5f3`; cards are `rounded-2xl border border-line bg-white shadow-sm`.

Two caveats when editing styles:

- **`.page-typography` is legacy.** It forces Playfair serif on `h1`/`h2` and outspecifies `font-display`. Don't add it to new pages.
- **`HomeComponents` and `DummyData` are legacy** too, left over from a previous clothing-store build. The live storefront renders `AutoComponents`; nothing calls those two modules any more.

Admins can override the primary colour and fonts at **Admin → Theme & Branding**; the values are injected as CSS variables in `root.html.heex`.

---

## Data Model Note

Spare parts reuse the generic product-variant fields, so watch out for the naming:

| Schema field | Actually holds |
|--------------|----------------|
| `size`       | Vehicle fitment, e.g. `"Toyota Premio/Allion"` |
| `color_name` | Part grade — `"OEM"` or `"Aftermarket"` |
| `color_hex`  | Swatch colour for that grade |

---

## Project Structure

```
lib/
├── dansunauto/                 # Business logic & contexts
│   ├── accounts/               # Users, auth tokens, notifiers
│   ├── collections/            # Part categories
│   ├── products/               # Part, variant, image schemas
│   ├── orders/                 # Order schema & context
│   ├── bundles/                # Service-kit bundles & items
│   ├── chat/                   # Customer live chat sessions
│   ├── customers/              # Customer records
│   ├── info_pages/             # DB-backed static pages
│   ├── promotions/             # Promo codes
│   ├── site_settings/          # Theme & branding settings
│   ├── testimonials/           # Customer testimonials
│   ├── app_config.ex           # Runtime config helpers (site_url, admin_email)
│   ├── gmail.ex                # Branded HTML email engine (Nexus API)
│   ├── order_notifier.ex       # Order confirmation & admin alert emails
│   ├── shop.ex                 # Read models for the storefront
│   └── paystack.ex             # Paystack payment verification
│
├── dansunauto_web/
│   ├── components/
│   │   ├── auto_components.ex     # Storefront chrome & marketing sections
│   │   ├── auth_components.ex     # Shared shell for /users/* pages
│   │   ├── core_components.ex     # Forms, tables, modals, flashes
│   │   ├── sidebar_components.ex  # Admin sidebar & nav
│   │   └── layouts/               # root / app / admin layouts
│   ├── live/                      # LiveViews (storefront + admin)
│   └── router.ex
│
priv/
├── repo/
│   ├── migrations/
│   └── seeds.exs               # Categories, parts, variants, bundle, testimonials
└── static/
    ├── robots.txt              # Disallows /admin, /users, /cart, /checkout, /success
    └── uploads/                # Uploaded part images
```

---

## Key Features

- **Storefront** — Hero, part categories, featured parts, service kits, why-choose-us, brands, services, how-it-works, testimonials, FAQ and contact
- **Part pages** — Image gallery, fitment + grade picker, fitment advice, availability notes
- **Cart & Checkout** — Persistent cart (localStorage) with a slide-out drawer, promo codes, Paystack inline payment, order confirmation
- **Order emails** — Branded HTML confirmation to the customer plus an admin notification per order
- **Admin Panel** — Dashboard with revenue/status/top-part charts, orders, parts, categories, bundles, promo codes, customers, live chat, team, info pages, theme & branding
- **Auth** — Role-based access (`super_admin`, `admin`, `member`), invite-only accounts, last-signed-in tracking
- **SEO** — Per-page titles and descriptions, canonical URLs, Open Graph/Twitter cards and `AutoRepair` JSON-LD with the shop's address, hours and phone

---

## Deployment

```bash
mix assets.deploy
mix ecto.migrate

PHX_HOST=dansunauto.com \
SITE_URL=https://dansunauto.com \
SECRET_KEY_BASE=<generated> \
DATABASE_URL=<postgres-url> \
mix phx.server
```
