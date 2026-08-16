import subprocess
import ipaddress
import re
from concurrent.futures import ThreadPoolExecutor, as_completed


def get_wifi_network():
    """
    Get the IP address and subnet of the Wi-Fi interface.
    """

    result = subprocess.run(
        ["ip", "-4", "addr", "show", "wlan0"],
        capture_output=True,
        text=True
    )

    match = re.search(r"inet\s+(\d+\.\d+\.\d+\.\d+/\d+)", result.stdout)

    if not match:
        raise RuntimeError("Could not find Wi-Fi IP address.")

    return ipaddress.ip_interface(match.group(1))


def ping(ip):
    """
    Ping one IP address.
    """

    result = subprocess.run(
        ["ping", "-c", "1", "-W", "1", str(ip)],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )

    return result.returncode == 0


def get_mac(ip):
    """
    Read MAC address from the Android/Linux neighbor table.
    """

    result = subprocess.run(
        ["ip", "neigh", "show", str(ip)],
        capture_output=True,
        text=True
    )

    match = re.search(
        r"lladdr\s+([0-9a-fA-F:]{17})",
        result.stdout
    )

    if match:
        return match.group(1)

    return "Unknown"


def main():

    print("=" * 50)
    print("        Wi-Fi Network Scanner")
    print("=" * 50)

    network = get_wifi_network()

    print(f"\nYour network : {network.network_address}/{network.network.prefixlen}")
    print(f"Your IP      : {network.ip}")
    print(f"Scanning     : {network.network_address} - {network.network.broadcast_address}")
    print("\nScanning...\n")

    hosts = []

    with ThreadPoolExecutor(max_workers=30) as executor:

        jobs = {
            executor.submit(ping, ip): ip
            for ip in network.network.hosts()
        }

        for job in as_completed(jobs):

            ip = jobs[job]

            try:
                if job.result():
                    hosts.append(ip)
            except Exception:
                pass

    hosts.sort()

    print("-" * 60)
    print(f"{'IP Address':<20} {'MAC Address':<20} {'Status'}")
    print("-" * 60)

    for ip in hosts:

        mac = get_mac(ip)

        print(f"{str(ip):<20} {mac:<20} ONLINE")

    print("-" * 60)
    print(f"\nFound {len(hosts)} responding host(s).")


if __name__ == "__main__":
    main()