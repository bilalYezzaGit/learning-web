# Paper-First Migration Plan

## AS-IS → TO-BE

### Current (AS-IS)
```
User → Login → Select Parcours → Browse Modules → Read Lessons → Do Exercises → Take QCMs
                                                    ↑ primary UX (heavy HTML)
```

The app is a full learning platform: long MDX-rendered pages, deep navigation
(parcours → module → section → activity), sidebar timelines, inline QCM player.
Mobile UX is functional but dense.

### Target (TO-BE)
```
User → Login → My Booklets → Scan/Pair QR → [Summary | Corrections | Quick QCM | Scan Upload]
                ↑ primary UX (lightweight)
```

The physical booklet is the main learning vehicle. The app augments it with:
- Short course summaries (1-2 screens max)
- Corrections/solutions per exercise (referenced by booklet page/exercise number)
- Quick QCM sessions (timed, 5/10/20 questions)
- Scan upload for AI correction
- Lightweight progress tracking

---

## What stays, what changes, what's deprecated

| Component | Status | Notes |
|-----------|--------|-------|
| MDX atoms (content/) | **STAYS** | Single source of truth, unchanged |
| PDF/print generation (/print/) | **STAYS** | Now the primary output channel |
| Content pipeline (tools/pipeline/) | **STAYS** | Generates HTML/JSON for both web and booklets |
| Auth system | **STAYS** | Unchanged |
| Progress tracking (useProgress) | **STAYS** | Extended with booklet context |
| QCMPlayer component | **STAYS** | Reused in Quick QCM feature |
| ScanUpload component | **STAYS** | Reused in booklet exercise flow |
| Parcours accueil (module list) | **DEPRECATED UI** | Becomes secondary, accessible from "full version" link |
| Module detail page | **DEPRECATED UI** | Still works, not primary entry point |
| Timeline layout (split view) | **DEPRECATED UI** | Lesson reading stays but behind "full lesson" link |
| Full lesson reading | **DEMOTED** | Behind "View full lesson (optional)" link |
| Series welcome/flow | **DEMOTED** | QCM extracted into Quick QCM, exercises into booklet |

---

## New Route Map

### Primary routes (mobile bottom nav)
```
/app/mes-livrets          → My Booklets (paired booklets list)
/app/mes-livrets/[id]     → Booklet detail (summary + exercises + QCM)
/app/scan                 → Scan/Pair (camera QR scanner + manual code entry)
/app/qcm                  → Quick QCM launcher (pick module, pick duration)
/app/qcm/session/[id]     → QCM session in progress
/app/progres              → Progress dashboard (by booklet/module)
```

### Secondary routes (kept, accessed from booklet detail or "full version")
```
/{parcours}/...           → All existing routes (kept working, no breakage)
/print/...                → Print booklet pages (kept, enhanced)
```

### Navigation structure
```
┌─────────────────────────────────────┐
│  [Logo]  Learning OS     [Avatar]   │  ← Header (reuse ParcoursShell pattern)
├─────────────────────────────────────┤
│                                     │
│          Page Content               │
│                                     │
├─────────────────────────────────────┤
│  📚       📷       ⚡      📊     │  ← Bottom Nav (mobile only)
│ Livrets  Scanner   QCM   Progres   │
└─────────────────────────────────────┘
```

---

## Data Model

### Booklet Entity
```typescript
interface Booklet {
  id: string              // auto-generated
  code: string            // short pairing code (e.g. "CONT-3M-001")
  moduleSlug: string      // links to cours molecule (e.g. "continuite")
  programmeId: string     // e.g. "3eme-math"
  title: string           // display title
  version: number         // booklet revision
  createdAt: string       // ISO date
}
```

### Pairing Payload (QR format)
```typescript
// QR code encodes a URL:
// https://www.aylansolutions.com/app/scan?code=CONT-3M-001
//
// The code resolves to:
interface PairingPayload {
  code: string            // short code
  moduleSlug: string      // which module
  programmeId: string     // which programme
  version: number         // booklet version
}
```

### User Booklet (Firestore: users/{uid}/booklets/{code})
```typescript
interface UserBooklet {
  code: string
  pairedAt: string        // ISO date
  moduleSlug: string
  programmeId: string
  lastOpenedAt: string
}
```

### Mapping: Booklet → Exercises → Solutions → QCM
```
Booklet (code: "CONT-3M-001")
  → moduleSlug: "continuite"
  → getCours("continuite") → sections → activities
    → For each exercise: getAtomHtml(id) → extract solution
    → For each QCM group: getCompiledQcm(ids) → QCM session
    → For lessons: short summary (first paragraph) + "voir le cours complet" link
```

No new database tables needed for content — we derive everything from the
existing generated content. Only user pairing is stored in Firestore.

---

## PR1 Scope (this PR)

### Deliverables
1. New route group `/app/` with layout (bottom nav shell)
2. Four placeholder pages: mes-livrets, scan, qcm, progres
3. Bottom navigation component (mobile)
4. Booklet types in src/types/
5. Booklet data utilities in src/lib/
6. Middleware update to allow /app/ routes
7. Soft redirect: authenticated users landing on /{parcours} see a banner
   pointing to the new /app/ experience

### NOT in PR1
- Real QR scanning (camera API)
- Firestore booklet pairing
- Real booklet detail pages with solutions
- QCM session flow with timer
- Progress dashboard with real data
