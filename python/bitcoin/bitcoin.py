import sys
import requests

API_KEY = "0fb57f1da57b060b23b325f5ce8d410ba8192b8746e3004c5b226cf991939d47"

def main():
    if len(sys.argv) != 2:
        sys.exit("Missing command-line argument")

    try:
        bitcoins = float(sys.argv[1])
    except ValueError:
        sys.exit("Command-line argument is not a number")

    url = "https://rest.coincap.io/v3/assets/bitcoin"
    headers = {
        "Authorization": f"Bearer {API_KEY}"
    }

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        data = response.json()
        price = float(data["data"]["priceUsd"])
    except requests.RequestException:
        sys.exit("Error fetching data from CoinCap API")
    except (KeyError, TypeError, ValueError):
        sys.exit("Unexpected response format from API")

    total_cost = bitcoins * price

    print(f"${total_cost:,.4f}")

if __name__ == "__main__":
    main()
