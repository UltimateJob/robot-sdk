#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
set -euo pipefail
mkdir -p .output/payload
uv sync --frozen --python 3.13 --all-packages --all-extras --group test
PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 uv run --frozen --group test --all-extras python -m pytest -q
uv build --all-packages
