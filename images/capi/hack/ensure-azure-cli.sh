#!/usr/bin/env bash

# Copyright 2020 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

[[ -n ${DEBUG:-} ]] && set -o xtrace

source hack/utils.sh

# Change directories to the parent directory of the one in which this
# script is located.
cd "$(dirname "${BASH_SOURCE[0]}")/.."

if command -v az >/dev/null 2>&1; then exit 0; fi

# Disable pip's version check and root user warning
export PIP_DISABLE_PIP_VERSION_CHECK=1 PIP_ROOT_USER_ACTION=ignore

ensure_py3
# pip3_install azure-cli
# ensure_py3_bin az azure-cli
