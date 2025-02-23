# LeetCode Swift 题解

<div align="center">
    <img src="https://img.shields.io/badge/language-Swift-orange.svg"/>
    <img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey.svg"/>
    <img src="https://img.shields.io/badge/license-MIT-blue.svg"/>
</div>

## 📖 项目简介

这是一个用 Swift 语言实现 LeetCode 题解的项目。项目不仅包含了各种算法题的 Swift 实现，还提供了一个自动化工具来生成标准的解题模板。

### ✨ 特性

- 🚀 自动从 LeetCode 获取题目信息
- 📝 生成标准的 Swift 解题模板
- 🎯 统一的代码风格和项目结构
- 🧪 内置测试用例支持
- 🔄 自动运行最新修改的题解

## 🗂 项目结构

```
LeetCode/
├── LeetCode/              # 主项目目录
│   ├── Basic.swift        # 基础数据结构（如 ListNode）
│   ├── LeetCodeSolution.swift  # 解题基类
│   ├── SolutionManager.swift   # 解题管理器
│   └── Solutions/         # LeetCode 解题文件
├── scripts/               # 工具脚本
│   ├── leetcode-gen.js    # 解题模板生成器
│   ├── templates/         # 模板文件
│   └── package.json       # Node.js 依赖配置
└── LeetCode.xcodeproj/    # Xcode 项目文件
```

## 🚀 快速开始

### 环境要求

- Xcode 14.0+
- Node.js 14.0+
- npm 或 yarn

### 安装步骤

1. 克隆项目：
```bash
git clone [repository-url]
cd LeetCode
```

2. 安装依赖：
```bash
cd scripts
npm install
```

3. 打开项目：
```bash
cd ..
open LeetCode.xcodeproj
```

## 💡 使用指南

### 生成新的题解模板

```bash
cd scripts
node leetcode-gen.js <题目编号>
```

例如：`node leetcode-gen.js 1` 会生成 "Two Sum" 的解题模板。

### 运行题解

1. 在 Xcode 中打开项目
2. 选择要运行的题解文件
3. 点击运行按钮或使用快捷键 ⌘R

### 自动运行最新题解

项目会自动检测最新修改的题解文件并运行，无需手动修改 main.swift。

## 📝 开发规范

### 代码风格

- 使用标准 Swift 代码风格
- 每个题解文件都应包含完整的问题描述和测试用例
- 注释要清晰明了
- 变量命名要有意义

### 提交规范

- 每个题解一个提交
- 提交信息格式：`LeetCode {题号}: {题目名称}`
- 保持提交历史清晰

## 🤝 贡献指南

1. Fork 本项目
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的改动 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 📄 开源协议

本项目采用 MIT 协议 - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

- LeetCode 平台提供的题目和 API
- 所有项目贡献者