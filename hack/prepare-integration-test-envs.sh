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

SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")/..
source "${SCRIPT_ROOT}/hack/lib/init.sh"

TEMP_DIR=${TMPDIR-/tmp}

cleanup() {
  rm -rf "${TEMP_DIR}/setup-envtest"
}


trap cleanup EXIT

kube::log::status "Configuring envtest"
source "${TEMP_DIR}/setup-envtest"

kube::log::status "Running integration test cases"

printenv >> ./.localtest_env

#/usr/local/go/bin/go test -c -o /private/var/folders/t3/yj8qmr7s50g6wbnmnmxlb_nh0000gn/T/GoLand/___TestCapacityScheduling_in_sigs_k8s_io_scheduler_plugins_test_integration.test sigs.k8s.io/scheduler-plugins/test/integration #gosetup
#/usr/local/go/bin/go tool test2json -t /private/var/folders/t3/yj8qmr7s50g6wbnmnmxlb_nh0000gn/T/GoLand/___TestCapacityScheduling_in_sigs_k8s_io_scheduler_plugins_test_integration.test -test.v -test.paniconexit0 -test.run ^\QTestCapacityScheduling\E$