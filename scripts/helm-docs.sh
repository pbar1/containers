#!/usr/bin/env bash
# Intended as a Makefile target, run from the GIT_ROOT directory
# Usage: bash helm-docs.sh [CHART_DIR]
set -o errexit -o pipefail

CHART_DIR="${1}"
GIT_ROOT="$(git rev-parse --show-toplevel)"

cd "${GIT_ROOT}/${CHART_DIR}"
helm-docs
