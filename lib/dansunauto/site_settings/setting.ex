defmodule Dansunauto.SiteSettings.Setting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "site_settings" do
    field :site_name, :string, default: "Dansunauto"
    field :site_tagline, :string, default: "Auto Repair and Parts Store"
    field :primary_color, :string, default: "#BB0A07"
    field :font_heading, :string, default: "Saira Condensed"
    field :font_body, :string, default: "Barlow"
    field :font_script, :string, default: "Dancing Script"
    field :logo_url, :string
    field :instagram_url, :string
    field :whatsapp_number, :string
    field :support_email, :string

    timestamps(type: :utc_datetime)
  end

  @fields ~w(site_name site_tagline primary_color font_heading font_body font_script
             logo_url instagram_url whatsapp_number support_email)a

  def changeset(setting, attrs) do
    setting
    |> cast(attrs, @fields)
    |> validate_required([:site_name, :primary_color])
    |> validate_format(:primary_color, ~r/^#[0-9A-Fa-f]{6}$/, message: "must be a valid hex color like #C8001F")
    |> validate_length(:site_name, max: 80)
    |> validate_length(:site_tagline, max: 160)
  end
end
