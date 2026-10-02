# AI융합원 · 이음 서포터즈 일정

서포터즈 할일·일정·활동 가능 시간을 관리하는 단일 페이지 앱입니다.
Vercel에 배포하고, 데이터는 Supabase에 저장해 모든 사용자가 실시간으로 공유합니다.

| 파일 | 역할 |
|---|---|
| `index.html` | 앱 본체 |
| `api/config.js` | Vercel 함수 — 환경 변수의 Supabase 접속 정보를 브라우저에 전달 |
| `supabase/schema.sql` | `app_state` 테이블·RLS·실시간 설정 |
| `supabase/seed.sql` | 2026-10-02 아티팩트에서 옮긴 현재 데이터 |
| `data.json` | 같은 데이터의 JSON 사본 (DB가 비어 있거나 연결 안 될 때 사용) |

## 설정

1. Supabase SQL Editor에서 `supabase/schema.sql` → `supabase/seed.sql` 순서로 실행
2. Vercel에서 이 저장소를 Import (Framework: Other, 빌드 설정 없음)
3. Vercel 환경 변수 추가 후 재배포
   - `SUPABASE_URL` — Project Settings → API → Project URL
   - `SUPABASE_ANON_KEY` — 같은 화면의 anon public key

## 저장 방식

- 전체 상태를 `app_state` 테이블의 `id = 'main'` 한 행에 JSON으로 저장 (마지막 저장이 우선)
- 다른 사람이 고치면 Supabase Realtime으로 바로 반영
- Supabase에 연결되지 않으면 브라우저(localStorage)에만 저장하고, 화면 상단에 "이 브라우저에 저장됨"으로 표시
- 접근 제한이 없어 **사이트 주소를 아는 사람은 누구나 읽고 고칠 수 있습니다.** 정기적으로 설정 → 백업 (JSON)을 받아 두세요.
