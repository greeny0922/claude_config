# Linear Ticket Creator

Linear 이슈를 규칙에 맞게 생성합니다.

## Arguments
$ARGUMENTS

## Linear API 설정

- **API Endpoint**: `https://api.linear.app/graphql`
- **API Key**: `~/.env_secrets` 파일의 `LINEAR_API_KEY` 환경변수 사용
- **인증 헤더**: `Authorization: {api_key}` (Bearer prefix 없이)
- **User ID**: `546919d6-c034-4a90-9a1f-3602c4c42f56` (Hanjun Cho)
- **Team ID**: `6e9aa730-dcfa-468e-8d27-4fde40fe9131` (AI Team)

## Steps

### 1. 인자 분석

`$ARGUMENTS`를 분석하여 다음을 파악한다:
- 어떤 작업인지 (기능개발, 버그픽스, 리서치, 실험 등)
- 어떤 도메인인지 (RARE, vLLM, Triton, Alli, Agent 등)
- 에픽/부모 이슈인지, 독립 이슈인지

### 2. 필수 라벨 3종 결정

**모든 이슈에 반드시 아래 3가지 라벨을 붙여야 한다.**

#### Cost (비용 분류)
| 라벨 | ID | 기준 |
|------|----|------|
| R&D | `ff51dd58-b8dd-4fc3-8f2a-eb234d3dee44` | 연구, 실험, 조사, 분석, 새 기술 탐색 |
| 판관비 (SGA) | `2ddb6410-1e54-454e-824b-21776130bf81` | 유지보수, 버그픽스, 운영, 기존 기능 개선, 고객 대응 |

#### Core Layer (기술 계층)
| 라벨 | ID | 기준 |
|------|----|------|
| Infrastructure | `bed9ba30-f9c3-437c-ba7a-ce83c3d7f0e6` | Triton, Grafana, 모니터링, 서버, 인프라 |
| Framework Layer | `64ef887b-d5c8-4f92-ae27-5ec93fd97619` | RARE, MiRA, 공통 프레임워크, 템플릿, 유틸리티 |
| Agentic RAG Layer | `d0cfd38a-a16d-42c4-b249-f6af0214dd8f` | RAG 파이프라인, Answer Highlight, 검색 최적화 |
| LLM Model Layer | `13557026-86fa-4cc2-be32-084b52a76fb9` | vLLM, 모델 서빙, Guided Decoding, 모델 성능, GPT-OSS |
| Agent Layer | `d8bc9e4b-8a14-4692-941a-aa0d78841797` | Agent 구축, OpenClaw, Tool Call, 에이전트 오케스트레이션 |
| Plugin Architecture | `c04ce2db-c0b4-4893-af98-ace618ef4696` | 플러그인, 확장 기능, 외부 연동 아키텍처 |
| Data Integrator | `098a27a5-75cc-4118-8d81-dc1dcde6bca7` | 데이터 연동, 통합 |
| Interface Layer | `77225e4e-8cb7-40d7-a0e6-e79dd3c5e0d7` | UI/UX 인터페이스 |

#### Activity Type (활동 유형)
| 라벨 | ID | 기준 |
|------|----|------|
| Development | `19305305-34f9-421f-8d55-d18ebf5ee4ba` | 기능 개발, 구현, 마이그레이션 |
| Bug Fix | `f9f2d21e-c410-47a3-9b74-5f8016168f23` | 버그 수정, 핫픽스 |
| Planning/Research | `0a0e721b-9397-429b-b5d9-7fcf6094ddc5` | 조사, 분석, 설계, 문서화 |
| QA/Test | `6fa2c41b-318c-430e-aba8-2319498e15eb` | QA, 테스트 |
| Experiment | `492bc0f9-a3be-43d8-aed3-caf315448db6` | 실험, 성능 테스트, 벤치마크 |

### 3. 독립 태그 결정

이슈 성격에 맞는 독립 태그를 1개 이상 선택:
| 태그 | ID | 기준 |
|------|----|------|
| Feature | `485a2588-9084-4959-86c6-6dc9f3a2c383` | 신규 기능, 기능 개선 |
| Research | `d9465f40-cfde-46c0-be88-3c5a83053c02` | 연구, 조사, 분석 |
| Bug | `967fe775-797f-4b2c-a0fc-2655c1e2ed44` | 버그 |
| Docs | `9e0bcd42-9caa-43e0-97a3-e4d29ef1a032` | 문서화 |
| RAG Agent | `0bda93b0-ccca-4d3b-b6ca-606b6b641ede` | RAG Agent 관련 |

### 4. 제목 이모지 결정

| 이모지 | 용도 |
|--------|------|
| 🍑 | 에픽/부모 이슈 (하위 이슈를 가질 예정) |
| 🌳 | 독립 이슈 (단일 작업) |

### 5. 프로젝트 배정

| 프로젝트 | ID | 기준 |
|----------|----|------|
| Core Part - Research | `907973d4-7531-41cc-b9c0-c06fb1ff5588` | 리서치, 실험, 분석 |
| Core Part - Infrastructure | `088e152b-8292-4c94-a606-72dc7778909b` | Triton, Grafana, 인프라 |
| RARE Migration | `baa0a819-57bb-4ab4-9459-639dbd170cbb` | RARE 관련 개발 |
| RAG Agent v2 개발 | `a12a7f23-f94d-4180-93bf-67b63448dc18` | RAG Agent 관련 |

프로젝트가 맞는 게 없으면 배정하지 않아도 됨.

### 6. 본문 작성

아래 형식으로 본문을 작성한다:

```
## 🧾 Overview
[이슈의 배경과 목적을 1~2문장으로]

## ❗️ Problem
[해결하려는 문제 또는 필요성]

## 💡 Solution
[접근 방식 또는 해결 방안]

## 🌟 Impact
[기대 효과 또는 영향 범위]
```

### 7. 이슈 생성

위에서 결정한 내용으로 Linear GraphQL API `issueCreate` mutation을 실행한다.

```graphql
mutation {
  issueCreate(input: {
    teamId: "6e9aa730-dcfa-468e-8d27-4fde40fe9131"
    title: "[이모지] [제목]"
    description: "[본문]"
    assigneeId: "546919d6-c034-4a90-9a1f-3602c4c42f56"
    labelIds: ["cost_id", "core_layer_id", "activity_type_id", "standalone_tag_ids..."]
    projectId: "[project_id]"
  }) {
    success
    issue { identifier title url }
  }
}
```

### 8. 결과 보고

생성된 이슈 정보를 아래 형식으로 보여준다:

```
✅ [identifier] 생성 완료
- 제목: [title]
- Cost: [cost]
- Core Layer: [core_layer]
- Activity: [activity_type]
- 태그: [tags]
- 프로젝트: [project]
- URL: [url]
```

## 예시

- `/linear RARE 관련 새 기능 개발` → SGA, Framework Layer, Development, Feature, RARE Migration
- `/linear vLLM 새 모델 성능 실험` → R&D, LLM Model Layer, Experiment, Research, Core Part - Research
- `/linear Grafana 대시보드 버그 수정` → SGA, Infrastructure, Bug Fix, Bug, Core Part - Infrastructure
- `/linear OpenClaw 에이전트 아키텍처 조사` → R&D, Agent Layer, Planning/Research, Research, Core Part - Research

## 주의사항

- `source ~/.env_secrets`로 API 키를 로드한 후 Python urllib로 API 호출
- 인증: `Authorization: {api_key}` (Bearer prefix 붙이지 않음)
- `labelIds`는 기존 라벨을 **대체**하므로 필요한 라벨 ID를 전부 포함해야 함
- 애매한 분류는 사용자에게 확인 후 진행

## Language
**Always respond in Korean.**
