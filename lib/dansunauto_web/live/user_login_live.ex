defmodule DansunautoWeb.UserLoginLive do
  use DansunautoWeb, :live_view

  def render(assigns) do
    ~H"""
    <.auth_shell
      title="Log in to account"
      subtitle="Admin access only. Contact the team owner to get an account."
    >
      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
            <.auth_link href={~p"/users/reset_password"}>Forgot your password?</.auth_link>
          </div>
        </:actions>
        <:actions>
          <.button phx-disable-with="Logging in..." class="w-full">
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </.auth_shell>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
