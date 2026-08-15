#!/usr/bin/env python3
"""
Fetch GitHub repositories for a user, aggregate language usage by bytes,
and print the top 10 languages by percentage.
Supports excluding specific languages and repositories via command-line arguments.
"""
import json
import urllib.request
import urllib.error
import sys
import os
import time
import argparse

GITHUB_API_BASE = "https://api.github.com"
TOKEN = os.environ.get("GITHUB_TOKEN")


def api_request(url):
    """Make a GitHub API request with proper headers and handle pagination."""
    headers = {
        "Accept": "application/vnd.github.v3+json",
        "User-Agent": "Python-urllib/3.10"
    }
    if TOKEN:
        headers["Authorization"] = f"token {TOKEN}"

    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req) as response:
            data = response.read().decode("utf-8")
            return json.loads(data), response.headers
    except urllib.error.HTTPError as e:
        print(f"HTTP error {e.code}: {e.reason}", file=sys.stderr)
        if e.code == 403 and "rate limit" in str(e):
            print("Rate limit exceeded. Try setting GITHUB_TOKEN environment variable.",
                  file=sys.stderr)
        sys.exit(1)
    except urllib.error.URLError as e:
        print(f"URL error: {e.reason}", file=sys.stderr)
        sys.exit(1)
    except json.JSONDecodeError:
        print("Invalid JSON response", file=sys.stderr)
        sys.exit(1)


def get_all_repos(username):
    """Fetch all repositories for a user, handling pagination."""
    repos = []
    page = 1
    per_page = 100
    while True:
        url = f"{GITHUB_API_BASE}/users/{username}/repos?per_page={per_page}&page={page}"
        data, headers = api_request(url)
        if not data:
            break
        repos.extend(data)
        link = headers.get("Link", "")
        if 'rel="next"' not in link:
            break
        page += 1
        time.sleep(0.5)
    return repos


def get_repo_languages(username, repo_name):
    """Fetch language breakdown for a single repository."""
    url = f"{GITHUB_API_BASE}/repos/{username}/{repo_name}/languages"
    data, _ = api_request(url)
    return data


def main():
    parser = argparse.ArgumentParser(
        description="Analyze language usage across a GitHub user's repositories."
    )
    parser.add_argument(
        "-u", "--username",
        help="GitHub username (if not provided, you will be prompted)"
    )
    parser.add_argument(
        "-L", "--exclude-lang",
        action="append",
        default=[],
        help="Exclude a language (can be used multiple times, e.g., -L 'Jupyter Notebook')"
    )
    parser.add_argument(
        "-R", "--exclude-repo",
        action="append",
        default=[],
        help="Exclude a repository by name (can be used multiple times)"
    )

    args = parser.parse_args()

    username = args.username
    if not username:
        username = input("Username: ").strip()
        if not username:
            print("Username is required.", file=sys.stderr)
            sys.exit(1)

    exclude_langs = set(args.exclude_lang)
    exclude_repos = set(args.exclude_repo)

    print(f"Fetching repositories for user '{username}'...", file=sys.stderr)
    repos = get_all_repos(username)
    print(f"Found {len(repos)} repositories.", file=sys.stderr)

    if not repos:
        print("No repositories found.", file=sys.stderr)
        sys.exit(0)

    # Filter out excluded repositories
    filtered_repos = [r for r in repos if r.get("name") not in exclude_repos]
    if exclude_repos:
        print(f"Filtered out {len(repos) - len(filtered_repos)} repositories by exclusion.",
              file=sys.stderr)

    lang_bytes = {}
    for idx, repo in enumerate(filtered_repos, 1):
        name = repo.get("name")
        if not name:
            continue
        print(f"Fetching languages for {name} ({idx}/{len(filtered_repos)})...", file=sys.stderr)
        langs = get_repo_languages(username, name)
        for lang, size in langs.items():
            if lang in exclude_langs:
                continue
            lang_bytes[lang] = lang_bytes.get(lang, 0) + size
        time.sleep(0.2)

    if not lang_bytes:
        print("No language data found (maybe all languages were excluded?).", file=sys.stderr)
        sys.exit(0)

    total = sum(lang_bytes.values())
    sorted_langs = sorted(lang_bytes.items(), key=lambda x: x[1], reverse=True)
    top10 = sorted_langs[:10]

    print("\nTop 10 programming languages by percentage (based on bytes of code):")
    print("-" * 50)
    for lang, size in top10:
        percentage = (size / total) * 100
        print(f"{lang:20} {percentage:6.2f}%")

    if len(sorted_langs) > 10:
        remaining = sum(size for _, size in sorted_langs[10:])
        rem_percent = (remaining / total) * 100
        print(f"{'Other':20} {rem_percent:6.2f}%")


if __name__ == "__main__":
    main()
