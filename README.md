# AI융합원 · 이음 서포터즈 일정

서포터즈 할일·일정·활동 가능 시간을 관리하는 단일 페이지 앱입니다.

- 배포: https://limjeomseob.github.io/AIsupporters/
- `index.html` — 앱 본체
- `data.json` — 기본 데이터 (2026-10-02 아티팩트 데이터 이관)

## 데이터 저장 방식

GitHub Pages는 정적 호스팅이라 공유 DB가 없습니다.

- 수정 내용은 **각자 브라우저(localStorage)** 에 저장됩니다.
- 처음 열거나, `data.json`이 브라우저 데이터보다 최신이면 `data.json`을 불러옵니다.
- 모두에게 반영하려면: 설정 → **백업 (JSON)** 으로 내려받은 파일을 `data.json`으로 교체해 커밋하세요.
