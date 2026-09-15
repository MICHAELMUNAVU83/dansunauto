defmodule DansunautoWeb.UserConfirmationInstructionsLive do
  use DansunautoWeb, :live_view

  alias Dansunauto.Accounts

  def render(assigns) do
    ~H"""
    <.auth_shell
      title="No confirmation instructions received?"
      subtitle="We'll send a new confirmation link to your inbox."
    >
      <.simple_form for={@form} id="resend_confirmation_form" phx-submit="send_instructions">
        <.input field={@form[:email]} type="email" label="Email" required />
        <:actions>
          <.button phx-disable-with="Sending..." class="w-full">
            Resend confirmation instructions
          </.button>
        </:actions>
      </.simple_form>

      <:links>
        <.auth_link href={~p"/users/register"}>Register</.auth_link>
        <span class="mx-2">·</span>
        <.auth_link href={~p"/users/log_in"}>Log in</.auth_link>
      </:links>
    </.auth_shell>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(%{}, as: "user"))}
  end

  def handle_event("send_instructions", %{"user" => %{"email" => email}}, socket) do
    if user = Accounts.get_user_by_email(email) do
      Accounts.deliver_user_confirmation_instructions(
        user,
        &(Dansunauto.AppConfig.site_url() <> ~p"/users/confirm/#{&1}")
      )
    end

    info =
      "If your email is in our system and it has not been confirmed yet, you will receive an email with instructions shortly."

    {:noreply,
     socket
     |> put_flash(:info, info)
     |> redirect(to: ~p"/")}
  end
end
