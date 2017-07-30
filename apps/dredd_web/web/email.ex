defmodule Myapp.Email do
  use Bamboo.Phoenix, view: Myapp.EmailView

  def sign_in_email(person) do
    base_email()
    |> to(person)
    |> subject("Your Sign In Link")
    |> assign(:person, person)
    |> render(:sign_in)
  end

  defp base_email do
    new_email()
    # This will use the "email.html.eex" file as a layout when rendering html emails.
    # Plain text emails will not use a layout unless you use `put_text_layout`
    |> put_html_layout({DreddWeb.LayoutView, "email.html"})
  end
end
