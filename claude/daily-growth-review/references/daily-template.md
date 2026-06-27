# Daily Review Template

Use this template for a single-day review. Keep the final output in Markdown.

## Required Output

````markdown
# 每日成长复盘 - YYYY-MM-DD

## 0. 今日一句话

用一句话概括今天的主线。避免鸡血口号，写出真实张力。

## 1. 时间轴图

| 时间 | 事件 | 类型 | 能量 | 备注 |
|---|---|---|---|---|
| 08:00-09:00 |  |  |  |  |

类型可选：深度工作 / 核心产出 / 恢复 / 消耗 / 内耗 / 生活维护 / 身体管理 / 社交 / 无意识漂移。
能量可用：高 / 中 / 低 / 坍塌 / 回升。

## 2. 今日事件之心

**事件**：

**为什么它重要**：

**它暴露的模式**：

**它可能带来的进步入口**：

## 3. 情绪显影与命名

| 情绪 | 触发事件 | 诗性命名 | 机制命名 | 追问后的发现 |
|---|---|---|---|---|

命名格式：`诗性命名：机制命名`

## 4. 三导师镜像

### 王阳明：知行合一，事上磨练

- 今日相合之处：
- 今日偏离之处：
- 明日一条修正：

### 曾国藩：日课反省，向内剖析

- 今日之过：
- 见微知著：
- 明日一条戒律：

### 马斯克：第一性原理，极限执行

- 事情的第一性原理：
- 今日复杂化/逃避之处：
- 明日最小极限动作：

## 5. 评分与距离目标

### 固定维度

| 维度 | 分数 | 图 | 依据 |
|---|---:|---|---|
| 知行合一 | /10 | □□□□□□□□□□ |  |
| 深度工作 | /10 | □□□□□□□□□□ |  |
| 核心产出 | /10 | □□□□□□□□□□ |  |
| 身体管理 | /10 | □□□□□□□□□□ |  |
| 情绪能量 | /10 | □□□□□□□□□□ |  |
| 反内耗 | /10 | □□□□□□□□□□ |  |

### 长期目标

| 目标 | 分数 | 图 | 今日距离 |
|---|---:|---|---|
| 身材管理 | /10 | □□□□□□□□□□ |  |
| 工作管理 | /10 | □□□□□□□□□□ |  |
| 科研产出 | /10 | □□□□□□□□□□ |  |

评分图示例：`██████░░░░ 6/10`。

## 6. 明日行动选项

| 选项 | 适用情况 | 明日动作 |
|---|---|---|
| 最小行动 | 状态低但不能断线 |  |
| 正面突破 | 有精力且阻碍清楚 |  |
| 环境改造 | 问题来自诱惑或混乱 |  |
| 恢复优先 | 身体/精神明显透支 |  |

**推荐选择**：

## 7. 周复盘索引字段

```yaml
date: YYYY-MM-DD
event_heart:
emotion_names:
mentor_deviations:
fixed_scores:
  知行合一:
  深度工作:
  核心产出:
  身体管理:
  情绪能量:
  反内耗:
goal_scores:
  身材管理:
  工作管理:
  科研产出:
tomorrow_action:
uncertainties:
```
````

## Field Rules

- If times are unknown, use approximate labels such as `上午`, `下午`, `晚上`, or `未知时段`.
- If the user gives too little information, ask targeted questions first; if still incomplete, produce a draft and mark `uncertainties`.
- The `事件之心` must be a growth-relevant event or obstacle, not a generic achievement.
- Scores must be evidence-based and may be low.
- Keep weekly index fields machine-readable enough for later weekly synthesis.
