# Petly

[English](./README.md)

<p align="center">
  <img src="./assets/app-icon.png" width="96" alt="Petly 图标" />
</p>

<p align="center">
  <img src="./assets/onboarding-pets.webp" alt="Petly 桌面宠物预览" />
</p>

Petly 是一个安静陪伴在桌面上的宠物伙伴。它会在你工作时停留在屏幕上，陪你互动、聊天，并通过日常照顾慢慢成长。

官网：https://petly.hpaiapp.com/

## 下载

最新桌面安装包可从官方 CDN 下载：

| 平台 | 下载 |
| --- | --- |
| macOS Apple Silicon | https://petly-static.hpaiapp.com/download/Petly-latest-mac-arm64.dmg |
| macOS Intel | https://petly-static.hpaiapp.com/download/Petly-latest-mac-x64.dmg |
| Windows x64 | https://petly-static.hpaiapp.com/download/Petly-latest-win-x64-setup.exe |
| Linux x64 | https://petly-static.hpaiapp.com/download/Petly-latest-linux-x86_64.AppImage |
| 校验文件 | https://petly-static.hpaiapp.com/download/SHA256SUMS |

GitHub Releases 中也可能附带同样的安装包，方便习惯从 GitHub 下载的用户使用。

## Petly 是什么

Petly 的目标是“存在但不打扰”：

- 在桌面上展示一个小宠物伙伴。
- 根据互动和日常状态做出反应。
- 在支持的 MacBook Pro 设备上可切换为紧凑的灵动岛模式。
- 支持安装和管理不同宠物。
- 通过喂食、签到、互动和聊天逐步养成。
- 使用云端账号同步宠物数据，方便后续恢复。

## 核心功能

### 桌面陪伴

Petly 会以小宠物的形式停留在桌面上。它以托盘和桌面宠物为主，不会强制打开一个庞大的主窗口。

### 宠物收藏

你可以浏览宠物目录、安装宠物、设置默认宠物，并通过云端账号同步自己的宠物收藏。

### 养成体系

通过喂食、签到和日常互动提升等级。Petly 更偏向轻量、低负担的日常陪伴，而不是高压任务系统。

### AI 聊天

VIP 用户可以通过 Petly 云端 AI 服务和宠物聊天。宠物会带有性格信息，让对话更像和自己的桌面伙伴互动。

### 云端账号和恢复

Petly 会自动创建云端账号，并提供用户 No 和恢复密钥。请妥善保管恢复密钥，它可用于恢复账号数据，不要泄露给他人。

## 安装说明

当前桌面安装包暂未签名和公证。macOS 和 Windows 首次启动时可能会出现系统安全提示。

Petly 会使用云端服务处理：

- 账号同步和恢复。
- 宠物数据和养成状态。
- 会员权益。
- 支付订单状态。
- AI 聊天。

## 发布说明

见 [CHANGELOG.md](./CHANGELOG.md)。

## 隐私和条款

- [隐私政策](./PRIVACY.md)
- [使用条款](./TERMS.md)

## 源码说明

这个公开仓库仅用于产品介绍和发布分发。桌面安装包会作为 release assets 发布。产品源码不会发布在这个仓库中。
