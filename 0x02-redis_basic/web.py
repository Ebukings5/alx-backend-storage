#!/usr/bin/env python3
"""
web.py - Module for implementing an expiring web cache and tracker using Redis.
"""

import redis
import requests
from requests.exceptions import RequestException
from redis.exceptions import RedisError, ConnectionError
from typing import Callable

# Initialize Redis client
try:
    client = redis.Redis(host='localhost', port=6379, db=0)
except ConnectionError as e:
    print(f"Error connecting to Redis: {e}")
    exit(1)


def get_page(url: str) -> str:
    """
    Retrieves the HTML content of a given URL and
    caches it in Redis for 10 seconds.
    Also tracks the number of times a particular URL was accessed.

    Args:
        url (str): The URL to retrieve the HTML content from.

    Returns:
        str: The HTML content of the URL or error message if the request fails.
    """
    try:
        # Increment the count of URL accesses
        client.incr(f"count:{url}")

        # Check if the URL content is cached
        cached_content = client.get(url)
        if cached_content:
            print(f"Cache hit for URL: {url}")
            return cached_content.decode('utf-8')

        # Fetch the URL content
        print(f"Cache miss for URL: {url}. Fetching from web...")
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Cache the content with an expiration time of 10 seconds
        client.setex(url, 10, response.text)

        return response.text

    except RequestException as e:
        print(f"Error fetching data from {url}: {e}")
        return f"Error: Could not retrieve content from {url}"

    except RedisError as e:
        print(f"Redis error: {e}")
        return "Error: Redis service is unavailable"


if __name__ == "__main__":
    # Example usage
    url = "http://slowwly.robertomurray.co.uk"  # Replace with a valid URL for testing
    print("Fetching page content...")
    content = get_page(url)

    print("\nPage HTML content:")
    print(content)

    try:
        access_count = client.get(f"count:{url}").decode('utf-8')
        print(f"\nAccess count for {url}: {access_count}")
    except RedisError as e:
        print(f"Error retrieving access count from Redis: {e}")