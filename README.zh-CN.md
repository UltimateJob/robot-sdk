# Semantic Robot SDK

[English](README.md) | [简体中文](README.zh-CN.md)

🤖 面向机器人资源、状态与动作的统一 Python 接口，连接 Fake、仿真和硬件适配层。上层 Ability 使用统一契约，不直接耦合仿真器调用。

## 工程结构

| 路径 | 职责 |
|---|---|
| `packages/core/` | 公共模型、资源契约、后端与运动基础组件 |
| `packages/r1pro/` | R1 Pro 适配 |
| `packages/franka/` | Franka 适配 |
| `tests/` | 契约与单元测试 |
| `integration-tests/` | 依赖资产 / Runtime 的集成测试 |

## 🛠 构建与测试

需要 uv 和 Python **3.11+**；quick-start Robot Bundle 使用 **3.13**。

```bash
uv sync --python 3.13 --all-packages --all-extras --group test
make test
make build
```

uv 工作区会在 `dist/` 中生成独立的 `semantic_robot_sdk_core`、`semantic_robot_sdk_r1pro`、`semantic_robot_sdk_franka` Wheel 及源码分发包。安装 core 和当前 Robot 所需的适配包，将匹配版本的 Wheel 作为 Bundle 构建输入。

## 使用方式

构造 SDK 前设置 `SEMANTIC_ROBOT_CONFIG`；R1 Pro 入口为 `R1ProSDK.from_environment()`。配置需要明确 Robot 身份与后端，选择机器人型号不等于连接到实例。

可选运动依赖和模型资产应与后端匹配。存在某个后端名称不代表已具备生产可用驱动；连接真机前请检查实现与测试。

## 常见问题

- Fake 契约测试不验证真机或渲染。
- 集成目标需要显式提供资产与兼容的运行中 Runtime，部分测试会创建和停止仿真场景。
- 原生依赖加载失败时，应检查 Wheel ABI、Python 与共享库版本，而不是修改导入路径。
- 部署使用安装后的 Wheel，源码 `PYTHONPATH` 覆盖仅用于开发。

[详细技术参考](README.reference.md) · [构建与测试目标](Makefile)

## 许可证

Copyright 2026 InsightOS。自有代码采用 [Apache-2.0](LICENSE)；第三方组件与资产请查看 [NOTICE](NOTICE) 和[许可范围](LICENSE_SCOPE.md)。
