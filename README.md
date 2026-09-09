# Semantic Robot SDK

[English](README.md) | [简体中文](README.zh-CN.md)

🤖 A shared Python interface for robot resources, state, and actions across Fake, simulation, and hardware adapters. Higher-level abilities use these contracts instead of embedding simulator-specific calls.

## Structure

| Path | Purpose |
|---|---|
| `packages/core/` | Shared models, resource contracts, backends, and motion primitives |
| `packages/r1pro/` | R1 Pro adapter |
| `packages/franka/` | Franka adapter |
| `tests/` | Contract and unit tests |
| `integration-tests/` | Asset/runtime-dependent integration tests |

## 🛠 Build and test

Requires uv and Python **3.11+**; use **3.13** for quick-start Robot Bundle compatibility.

```bash
uv sync --python 3.13 --all-packages --all-extras --group test
make test
make build
```

The uv workspace builds separate `semantic_robot_sdk_core`, `semantic_robot_sdk_r1pro`, and `semantic_robot_sdk_franka` Wheels in `dist/` (plus source distributions). Install core and the adapter required by your Robot; copy version-matched Wheels into bundle build inputs.

## Use the SDK

Configure `SEMANTIC_ROBOT_CONFIG` before constructing an SDK instance. For R1 Pro the entry point is `R1ProSDK.from_environment()`. The configuration identifies the Robot and backend; selecting a model is not the same as connecting an instance.

Optional motion dependencies and model assets must match the chosen backend. A named backend is not a guarantee that a production driver exists; consult the implementation and tests before using real hardware.

## Troubleshooting

- Fake contract tests do not validate real hardware or rendering.
- Integration targets require explicitly supplied assets and a running compatible Runtime; some create and stop simulation scenes.
- Native dependency errors require checking Wheel ABI, Python version, and shared libraries, not changing the SDK import path.
- Prefer installed Wheels in deployed Robots; source `PYTHONPATH` overrides are for development.

[Detailed technical reference](README.reference.md) · [Build/test targets](Makefile)

## License

Copyright 2026 InsightOS. First-party code: [Apache-2.0](LICENSE). See [NOTICE](NOTICE) and [license scope](LICENSE_SCOPE.md) for third-party components and assets.
