import Ecto.Query, only: [from: 2]

alias Dansunauto.Repo
alias Dansunauto.Collections.Collection
alias Dansunauto.Products.Product
alias Dansunauto.ProductVariants.ProductVariant
alias Dansunauto.Testimonials.Testimonial
alias Dansunauto.InfoPages.InfoPage

# ─────────────────────────────────────────────────────────────────────────────
# Dansun Auto Garage & Spare Shop — Umoja I, Nairobi.
# Content follows dansun-auto-garage-content.md.
#
# Note on the data model: products here are spare parts, so the generic
# `size`/`color` variant fields are used as:
#   size       → vehicle fitment  (e.g. "Toyota Premio 2007-2015")
#   color_name → part grade       ("OEM" / "Aftermarket")
# ─────────────────────────────────────────────────────────────────────────────

phone = "+254 724 335924"
wa = "https://wa.me/254724335924"

# Clear existing seed data so seeds can be re-run safely
Repo.delete_all(Dansunauto.Testimonials.Testimonial)
Repo.delete_all(Dansunauto.BundleItems.BundleItem)
Repo.delete_all(Dansunauto.Bundles.Bundle)
Repo.delete_all(Dansunauto.ProductVariants.ProductVariant)
Repo.delete_all(Dansunauto.ProductImages.ProductImage)
Repo.delete_all(Dansunauto.Products.Product)
Repo.delete_all(Dansunauto.Collections.Collection)
IO.puts("🗑️   Cleared existing data.")

# ─── Collections (spare-part categories) ─────────────────────────────────────

part_image = fn slug -> "/images/auto-parts/#{slug}.webp" end

collections = [
  %{
    title: "Brakes",
    slug: "brakes",
    image: part_image.("front-brake-discs-pair"),
    position: 1,
    is_active: true
  },
  %{
    title: "Filters & Service Parts",
    slug: "filters-and-service-parts",
    image: part_image.("oil-filter"),
    position: 2,
    is_active: true
  },
  %{
    title: "Engine Components",
    slug: "engine-components",
    image: part_image.("water-pump"),
    position: 3,
    is_active: true
  },
  %{
    title: "Suspension & Steering",
    slug: "suspension-and-steering",
    image: part_image.("front-shock-absorbers-pair"),
    position: 4,
    is_active: true
  },
  %{
    title: "Electrical & Batteries",
    slug: "electrical-and-batteries",
    image: part_image.("car-battery-12v-60ah"),
    position: 5,
    is_active: true
  },
  %{
    title: "Belts & Ignition",
    slug: "belts-and-ignition",
    image: part_image.("timing-belt-kit"),
    position: 6,
    is_active: true
  }
]

inserted_collections =
  Enum.map(collections, fn attrs ->
    {:ok, collection} =
      %Collection{}
      |> Collection.changeset(attrs)
      |> Repo.insert()

    collection
  end)

get_collection = fn slug ->
  Enum.find(inserted_collections, &(&1.slug == slug))
end

# ─── Products (spare parts) ──────────────────────────────────────────────────
#
# `fitments` becomes one variant row per vehicle (stored in `size`);
# `grades` becomes the part grade (stored in `color_name`, with the swatch
# hex looked up in `grade_colors`).

fitment_note = """
Confirm fitment before ordering. Send us your vehicle make, model, year and \
the part name or part number — a photo of the old part helps too — and we \
will confirm the correct part and current availability.\
"""

availability_note = """
Stocked at our Umoja I shop where available; other parts are sourced on \
request, usually within 1–3 working days. Call or WhatsApp +254 724 335924 \
to confirm availability before travelling.\
"""

common = [
  "Toyota Premio/Allion",
  "Nissan Note/Tiida",
  "Mazda Demio/Axela",
  "Subaru Forester/Impreza",
  "Honda Fit/Civic",
  "Mitsubishi Lancer/Outlander"
]

# Grade swatches shown on the variant picker. Distinct hues rather than two
# near-identical greys, so the grade is readable at swatch size.
grade_colors = %{
  "OEM" => "#1F3A5F",
  "Aftermarket" => "#8A8F98"
}

# Badges are derived from the flags a part already carries, so the label and
# its colour can never drift apart. Hex (not "red"): `badge_color` is written
# straight into `background-color` and edited by a colour input in the admin,
# which only accepts #rrggbb.
badge_for = fn
  %{is_bestseller: true} -> {"Bestseller", "#BB0A07"}
  %{is_new_arrival: true} -> {"New Arrival", "#0F7B6C"}
  %{is_featured: true} -> {"Featured", "#1D4ED8"}
  _ -> {nil, nil}
end

products = [
  # ── Brakes ────────────────────────────────────────────────────────────────
  %{
    name: "Front Brake Pads Set",
    slug: "front-brake-pads-set",
    description:
      "Front brake pad set for common Japanese saloons and hatchbacks. Supplied as a full axle set of four pads. Fitting available at the garage.",
    base_price: 3_500,
    image: part_image.("front-brake-pads-set"),
    is_featured: true,
    is_bestseller: true,
    is_new_arrival: false,
    position: 1,
    status: "active",
    collection_slug: "brakes",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Rear Brake Pads Set",
    slug: "rear-brake-pads-set",
    description:
      "Rear brake pad set, supplied as a full axle set. Fitted and bedded in at the garage on request.",
    base_price: 3_200,
    image: part_image.("rear-brake-pads-set"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 2,
    status: "active",
    collection_slug: "brakes",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Front Brake Discs (Pair)",
    slug: "front-brake-discs-pair",
    description:
      "Pair of front brake discs. We measure your existing discs for thickness and run-out before recommending replacement.",
    base_price: 8_500,
    image: part_image.("front-brake-discs-pair"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 3,
    status: "active",
    collection_slug: "brakes",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Brake Fluid DOT 4 (1L)",
    slug: "brake-fluid-dot-4-1l",
    description:
      "DOT 4 brake fluid, 1 litre. Recommended change interval is every two years or as specified by your vehicle handbook.",
    base_price: 950,
    image: part_image.("brake-fluid-dot-4-1l"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 4,
    status: "active",
    collection_slug: "brakes",
    fitments: ["Universal"],
    grades: ["OEM"]
  },

  # ── Filters & Service Parts ───────────────────────────────────────────────
  %{
    name: "Oil Filter",
    slug: "oil-filter",
    description: "Engine oil filter. Replaced at every oil change as part of a routine service.",
    base_price: 800,
    image: part_image.("oil-filter"),
    is_featured: true,
    is_bestseller: true,
    is_new_arrival: false,
    position: 5,
    status: "active",
    collection_slug: "filters-and-service-parts",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Air Filter",
    slug: "air-filter",
    description:
      "Engine air filter. A clogged filter costs you fuel — we check it at every service and replace as needed.",
    base_price: 1_200,
    image: part_image.("air-filter"),
    is_featured: true,
    is_bestseller: false,
    is_new_arrival: false,
    position: 6,
    status: "active",
    collection_slug: "filters-and-service-parts",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Fuel Filter",
    slug: "fuel-filter",
    description:
      "In-line or in-tank fuel filter depending on model. Confirm your vehicle details so we supply the correct type.",
    base_price: 1_800,
    image: part_image.("fuel-filter"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 7,
    status: "active",
    collection_slug: "filters-and-service-parts",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Cabin / Pollen Filter",
    slug: "cabin-pollen-filter",
    description:
      "Cabin air filter. Worth replacing if your vents smell musty or airflow has dropped.",
    base_price: 1_500,
    image: part_image.("cabin-pollen-filter"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: true,
    position: 8,
    status: "active",
    collection_slug: "filters-and-service-parts",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Engine Oil 5W-30 (4L)",
    slug: "engine-oil-5w30-4l",
    description:
      "Semi-synthetic 5W-30 engine oil, 4 litre pack. Fitted with a new oil filter as part of a routine service.",
    base_price: 4_500,
    image: part_image.("engine-oil-5w30-4l"),
    is_featured: true,
    is_bestseller: true,
    is_new_arrival: false,
    position: 9,
    status: "active",
    collection_slug: "filters-and-service-parts",
    fitments: ["Universal"],
    grades: ["OEM"]
  },

  # ── Engine Components ─────────────────────────────────────────────────────
  %{
    name: "Water Pump",
    slug: "water-pump",
    description:
      "Cooling system water pump. Often replaced together with the timing belt — ask us to quote both together.",
    base_price: 6_500,
    image: part_image.("water-pump"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 10,
    status: "active",
    collection_slug: "engine-components",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Radiator",
    slug: "radiator",
    description:
      "Replacement radiator. We pressure-test the cooling system first so you are not replacing a part that is not the fault.",
    base_price: 12_000,
    image: part_image.("radiator"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 11,
    status: "active",
    collection_slug: "engine-components",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Thermostat",
    slug: "thermostat",
    description:
      "Cooling system thermostat. A common cause of overheating and of an engine that never reaches temperature.",
    base_price: 2_200,
    image: part_image.("thermostat"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 12,
    status: "active",
    collection_slug: "engine-components",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Clutch Kit",
    slug: "clutch-kit",
    description:
      "Clutch kit — plate, cover and release bearing. Fitting available at the garage; we will quote parts and labour separately.",
    base_price: 18_000,
    image: part_image.("clutch-kit"),
    is_featured: true,
    is_bestseller: false,
    is_new_arrival: false,
    position: 13,
    status: "active",
    collection_slug: "engine-components",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },

  # ── Suspension & Steering ─────────────────────────────────────────────────
  %{
    name: "Front Shock Absorbers (Pair)",
    slug: "front-shock-absorbers-pair",
    description:
      "Pair of front shock absorbers. Always replaced in pairs so the car sits and handles evenly.",
    base_price: 11_000,
    image: part_image.("front-shock-absorbers-pair"),
    is_featured: true,
    is_bestseller: false,
    is_new_arrival: false,
    position: 14,
    status: "active",
    collection_slug: "suspension-and-steering",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Lower Control Arm Bushes",
    slug: "lower-control-arm-bushes",
    description:
      "Lower control arm bush set. Worn bushes cause knocking over bumps and uneven tyre wear.",
    base_price: 2_800,
    image: part_image.("lower-control-arm-bushes"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 15,
    status: "active",
    collection_slug: "suspension-and-steering",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Ball Joint",
    slug: "ball-joint",
    description:
      "Suspension ball joint. We check play on both sides during inspection and advise whether one or both need replacing.",
    base_price: 2_500,
    image: part_image.("ball-joint"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 16,
    status: "active",
    collection_slug: "suspension-and-steering",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Tie Rod End",
    slug: "tie-rod-end",
    description: "Steering tie rod end. Wheel alignment is recommended after fitting.",
    base_price: 2_000,
    image: part_image.("tie-rod-end"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 17,
    status: "active",
    collection_slug: "suspension-and-steering",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },

  # ── Electrical & Batteries ────────────────────────────────────────────────
  %{
    name: "Car Battery 12V 60Ah",
    slug: "car-battery-12v-60ah",
    description:
      "12V 60Ah maintenance-free battery for most saloons and small SUVs. We test your charging system before fitting a new battery.",
    base_price: 9_500,
    image: part_image.("car-battery-12v-60ah"),
    is_featured: true,
    is_bestseller: true,
    is_new_arrival: false,
    position: 18,
    status: "active",
    collection_slug: "electrical-and-batteries",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Alternator",
    slug: "alternator",
    description:
      "Replacement alternator. A flat battery is often an alternator fault — we diagnose before recommending either.",
    base_price: 16_000,
    image: part_image.("alternator"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 19,
    status: "active",
    collection_slug: "electrical-and-batteries",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Starter Motor",
    slug: "starter-motor",
    description:
      "Replacement starter motor. Bring the vehicle in and we will confirm whether it is the starter, the battery or the wiring.",
    base_price: 14_000,
    image: part_image.("starter-motor"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: false,
    position: 20,
    status: "active",
    collection_slug: "electrical-and-batteries",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },

  # ── Belts & Ignition ──────────────────────────────────────────────────────
  %{
    name: "Spark Plugs (Set of 4)",
    slug: "spark-plugs-set-of-4",
    description:
      "Set of four spark plugs. Worth replacing if you have rough idling, misfires or poor fuel consumption.",
    base_price: 2_400,
    image: part_image.("spark-plugs-set-of-4"),
    is_featured: true,
    is_bestseller: true,
    is_new_arrival: false,
    position: 21,
    status: "active",
    collection_slug: "belts-and-ignition",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Timing Belt Kit",
    slug: "timing-belt-kit",
    description:
      "Timing belt with tensioner and idler pulleys. Replace at the manufacturer's interval — a snapped belt can destroy the engine.",
    base_price: 9_000,
    image: part_image.("timing-belt-kit"),
    is_featured: true,
    is_bestseller: false,
    is_new_arrival: false,
    position: 22,
    status: "active",
    collection_slug: "belts-and-ignition",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Alternator / Fan Belt",
    slug: "alternator-fan-belt",
    description:
      "Auxiliary drive belt. A squeal on start-up usually means the belt or its tensioner needs attention.",
    base_price: 1_600,
    image: part_image.("alternator-fan-belt"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: true,
    position: 23,
    status: "active",
    collection_slug: "belts-and-ignition",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  },
  %{
    name: "Ignition Coil",
    slug: "ignition-coil",
    description:
      "Ignition coil pack. A diagnostic scan will tell us which cylinder is misfiring before you buy a replacement.",
    base_price: 4_200,
    image: part_image.("ignition-coil"),
    is_featured: false,
    is_bestseller: false,
    is_new_arrival: true,
    position: 24,
    status: "active",
    collection_slug: "belts-and-ignition",
    fitments: common,
    grades: ["OEM", "Aftermarket"]
  }
]

inserted_products =
  Enum.map(products, fn attrs ->
    {collection_slug, attrs} = Map.pop(attrs, :collection_slug)
    {fitments, attrs} = Map.pop(attrs, :fitments)
    {grades, attrs} = Map.pop(attrs, :grades)
    {badge_label, badge_color} = badge_for.(attrs)

    attrs =
      attrs
      |> Map.put(:badge_label, badge_label)
      |> Map.put(:badge_color, badge_color)
      |> Map.put(:collection_id, get_collection.(collection_slug).id)
      |> Map.put(:size_advice, fitment_note)
      |> Map.put(:shipping_returns, availability_note)

    {:ok, product} =
      %Product{}
      |> Product.changeset(attrs)
      |> Repo.insert()

    # One variant per grade × fitment.
    Enum.each(grades, fn grade_name ->
      Enum.each(fitments, fn fitment ->
        {:ok, _} =
          %ProductVariant{}
          |> ProductVariant.changeset(%{
            product_id: product.id,
            color_name: grade_name,
            color_hex: Map.fetch!(grade_colors, grade_name),
            size: fitment,
            stock_quantity: "5"
          })
          |> Repo.insert()
      end)
    end)

    product
  end)

get_product = fn slug ->
  Enum.find(inserted_products, &(&1.slug == slug))
end

variant_count =
  Enum.reduce(products, 0, fn p, acc -> acc + length(p.fitments) * length(p.grades) end)

IO.puts(
  "✅  Seeded #{length(inserted_collections)} collections, #{length(inserted_products)} parts, #{variant_count} variants."
)

# ─── Bundle ───────────────────────────────────────────────────────────────────

{:ok, bundle} =
  %Dansunauto.Bundles.Bundle{}
  |> Dansunauto.Bundles.Bundle.changeset(%{
    title: "Minor Service Kit",
    description:
      "Everything a routine minor service needs, in one go — engine oil, oil filter, air filter and a set of spark plugs. Bring the car to our Umoja I workshop and we will fit it for you, or take the kit away and fit it yourself.",
    image: part_image.("engine-oil-5w30-4l"),
    is_active: true
  })
  |> Repo.insert()

bundle_item_slugs = [
  "engine-oil-5w30-4l",
  "oil-filter",
  "air-filter",
  "spark-plugs-set-of-4"
]

Enum.each(bundle_item_slugs, fn slug ->
  {:ok, _} =
    %Dansunauto.BundleItems.BundleItem{}
    |> Dansunauto.BundleItems.BundleItem.changeset(%{
      bundle_id: bundle.id,
      product_id: get_product.(slug).id
    })
    |> Repo.insert()
end)

IO.puts("✅  Seeded 1 bundle with #{length(bundle_item_slugs)} items.")

# ─── Testimonials ─────────────────────────────────────────────────────────────
#
# The content brief supplies no customer reviews, and inventing them would put
# fabricated quotes on the homepage. The reviews section hides itself while this
# list is empty — add real ones through the admin at /admin/testimonials.

testimonials = []

Enum.each(testimonials, fn attrs ->
  {product_slug, attrs} = Map.pop(attrs, :product_slug)

  {:ok, _} =
    %Testimonial{}
    |> Testimonial.changeset(Map.put(attrs, :product_id, get_product.(product_slug).id))
    |> Repo.insert()
end)

IO.puts("✅  Seeded #{length(testimonials)} testimonials.")

# ── Info Pages ────────────────────────────────────────────────────────────────

# Drop the pages left over from the previous (fashion) business — their content
# is wrong for a garage and the storefront no longer links to them.
{stale, _} =
  Repo.delete_all(
    from(p in InfoPage,
      where: p.slug in ["how-to-order", "size-guide", "shipping-delivery", "returns-exchanges"]
    )
  )

if stale > 0, do: IO.puts("🗑️   Removed #{stale} obsolete info page(s).")

# Info pages are NOT cleared on re-seed so admin edits are preserved.
# Only insert when the slug doesn't already exist.
info_pages = [
  %{
    slug: "about-us",
    title: "About Us",
    icon: "🔧",
    position: 1,
    meta_description:
      "Dansun Auto Garage — automotive repair and spare parts for motorists in Umoja and the greater Nairobi area.",
    content: """
    ## Your Trusted Automotive Partner

    Dansun Auto Garage is an automotive repair and spare parts business serving motorists in Umoja and the greater Nairobi area.

    We understand how important it is to keep your vehicle reliable and on the road. Our focus is on providing practical automotive solutions, from regular servicing and repairs to helping customers find the right spare part.

    ### Our Goal

    To provide reliable automotive services, quality parts, and straightforward customer service.

    ### Why Choose Dansun?

    - **Experienced mechanics** — professional automotive repair and maintenance.
    - **Quality spare parts** — reliable replacement parts for a variety of makes and models.
    - **Fair pricing** — clear recommendations and practical solutions for your vehicle.
    - **Convenient location** — Umoja I, Nairobi.

    ### Visit or Call Us

    **Location:** Umoja I, Nairobi, Kenya
    **Phone:** #{phone}
    **WhatsApp:** #{wa}
    """
  },
  %{
    slug: "services",
    title: "Services",
    icon: "🛠️",
    position: 2,
    meta_description:
      "Vehicle repairs, servicing and diagnostics at Dansun Auto Garage in Umoja, Nairobi.",
    content: """
    ## What We Do

    ### Vehicle Repairs

    We provide repair services for common vehicle problems:

    - Engine repairs
    - Brake servicing
    - Suspension repairs
    - Steering repairs
    - Cooling system repairs
    - Battery replacement
    - Clutch repairs
    - General mechanical repairs

    ### Vehicle Servicing

    Routine maintenance helps keep your vehicle reliable and reduces the risk of unexpected breakdowns:

    - Oil changes
    - Oil filter replacement
    - Air filter replacement
    - Fluid checks and top-ups
    - Engine checks
    - General vehicle inspection
    - Preventive maintenance

    ### Vehicle Diagnostics

    Not sure what is wrong with your vehicle? Our team can inspect it and help identify the problem before repairs begin:

    - Engine checks
    - Warning light checks
    - Performance troubleshooting
    - Electrical fault diagnosis
    - General mechanical inspection

    ### Book a Service

    Call **#{phone}** or message us on WhatsApp to arrange a visit.
    """
  },
  %{
    slug: "spare-parts",
    title: "Spare Parts",
    icon: "⚙️",
    position: 3,
    meta_description:
      "Spare parts for a range of vehicle makes and models — brake pads, filters, spark plugs, belts, batteries and more.",
    content: """
    ## Find the Right Part for Your Vehicle

    Dansun Auto Garage supplies and sources spare parts for different vehicle makes and models.

    ### Common parts

    - Brake pads
    - Oil filters
    - Air filters
    - Fuel filters
    - Spark plugs
    - Belts
    - Suspension components
    - Batteries
    - Engine components

    ### Can't Find Your Part?

    Send us:

    1. Vehicle make
    2. Vehicle model
    3. Year
    4. Part name or part number
    5. Photo of the part, where possible

    Our team will help you identify the correct part and confirm availability.

    **Ask about a spare part:** #{phone} · #{wa}
    """
  },
  %{
    slug: "vehicle-makes",
    title: "Vehicle Makes",
    icon: "🚗",
    position: 4,
    meta_description:
      "Vehicle makes Dansun Auto Garage regularly works on — Toyota, Nissan, Mazda, Subaru, Honda and Mitsubishi.",
    content: """
    ## Vehicles We Work On

    We assist customers with a range of popular vehicle makes, including:

    - Toyota
    - Nissan
    - Mazda
    - Subaru
    - Honda
    - Mitsubishi

    Other makes may be supported depending on the required service or spare part availability. Call **#{phone}** and tell us your vehicle's make, model and year.
    """
  },
  %{
    slug: "how-it-works",
    title: "How It Works",
    icon: "📋",
    position: 5,
    meta_description:
      "How to get your vehicle repaired or find a spare part at Dansun Auto Garage, step by step.",
    content: """
    ## From Enquiry to Back on the Road

    ### 1. Contact Us

    Call or WhatsApp Dansun Auto Garage on **#{phone}**.

    ### 2. Tell Us What You Need

    Share your vehicle make, model, year, and the problem or spare part you need.

    ### 3. Get Assistance

    Our team will advise you on the next step, including inspection, repair, or spare part availability.

    ### 4. Visit the Garage

    Bring your vehicle to our Umoja location when inspection or repair is required.

    ### 5. Get Back on the Road

    We work to get your vehicle running properly and safely again.
    """
  },
  %{
    slug: "faq",
    title: "FAQ",
    icon: "❓",
    position: 6,
    meta_description:
      "Frequently asked questions about repairs, servicing and spare parts at Dansun Auto Garage.",
    content: """
    ## Frequently Asked Questions

    ### Do you sell spare parts?

    Yes. Dansun supplies and sources spare parts for different vehicle makes and models. Contact the shop to confirm current availability.

    ### How do I ask for a specific spare part?

    Send the vehicle make, model, year, and the name or part number of the component. A photo can also help identify the correct part.

    ### Do you repair vehicles?

    Yes. Dansun Auto Garage provides automotive repair and maintenance services.

    ### Where are you located?

    Dansun Auto Garage is located in Umoja I, Nairobi, Kenya.

    ### Can I contact you through WhatsApp?

    Yes — use the business number **#{phone}** to enquire about services and spare parts.
    """
  },
  %{
    slug: "contact",
    title: "Contact",
    icon: "📞",
    position: 7,
    meta_description:
      "Contact Dansun Auto Garage in Umoja I, Nairobi — call or WhatsApp +254 724 335924.",
    content: """
    ## Dansun Auto Garage

    **Location:** Umoja I, Nairobi, Kenya
    **Phone:** #{phone}
    **WhatsApp:** #{wa}

    ### Working Hours

    - Mon – Sat: 8:00 AM – 6:00 PM
    - Sunday: Closed
    - Closed on public holidays

    ### Sending an Enquiry

    To help us respond quickly, include:

    - Full name
    - Phone number
    - Vehicle make
    - Vehicle model
    - Service or part needed
    - A short description of the problem
    """
  }
]

inserted_info_pages =
  Enum.reduce(info_pages, 0, fn attrs, count ->
    case Repo.get_by(InfoPage, slug: attrs.slug) do
      nil ->
        {:ok, _} =
          %InfoPage{}
          |> InfoPage.changeset(attrs)
          |> Repo.insert()

        count + 1

      _existing ->
        count
    end
  end)

IO.puts(
  "✅  Seeded #{inserted_info_pages} info pages (#{length(info_pages) - inserted_info_pages} already existed)."
)

alias Dansunauto.Repo
alias Dansunauto.Accounts
alias Dansunauto.Accounts.User

admin_users = [
  %{
    name: "Michael Munavu",
    email: "michaelmunavu83@gmail.com",
    password: "123456",
    role: "super_admin"
  }
]

inserted =
  Enum.reduce(admin_users, 0, fn attrs, count ->
    case Repo.get_by(User, email: attrs.email) do
      nil ->
        case Accounts.invite_user(attrs) do
          {:ok, _user} ->
            IO.puts("  ✅  Created admin: #{attrs.email}")
            count + 1

          {:error, changeset} ->
            IO.puts("  ❌  Failed to create #{attrs.email}: #{inspect(changeset.errors)}")
            count
        end

      existing ->
        {:ok, _} = Accounts.admin_update_user(existing, Map.take(attrs, [:name, :role]))
        IO.puts("  ℹ️   Already exists (role updated): #{attrs.email}")
        count
    end
  end)

IO.puts("\n✅  Admin seed complete — #{inserted} new user(s) created.")
IO.puts("\n🔐  Default credentials:")

Enum.each(admin_users, fn u ->
  IO.puts("     Email:    #{u.email}")
  IO.puts("     Password: #{u.password}")
  IO.puts("     Role:     #{u.role}")
end)

IO.puts("\n⚠️   Change the password after your first login!\n")

# mix run priv/repo/seeds_admin.exs
