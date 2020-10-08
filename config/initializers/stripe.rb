Rails.configuration.stripe = {
    :publishable_key => "pk_test_51HT6XlJHPU2SoKgbiDU5CV2s4J4PoJhT8P2bFGcWpC4Y9gmNXRGBwCrdRnfhDEZRB0aYphMOfBgLwjzDBnA22tPq00CirDgydu \
SECRET_KEY=sk_test_51HT6XlJHPU2SoKgbUBhjdPyFAp6WvSH9vCzkFi3e3Gx9QxxW6YQOnmCMD9dV3h8jb9eO4WYLBzh9sRMnFL4yBgt50068f1mpEy",
    :secret_key      => "sk_test_51HT6XlJHPU2SoKgbUBhjdPyFAp6WvSH9vCzkFi3e3Gx9QxxW6YQOnmCMD9dV3h8jb9eO4WYLBzh9sRMnFL4yBgt50068f1mpEy"

}
Stripe.api_key = Rails.configuration.stripe[:secret_key]