# Technical Decisions Document

## 1. Why Flutter? (vs React Native, Native)
**Decision:** Use Flutter
**Reason:**
- Single codebase for iOS, Android, Web, Desktop
- Hot reload for faster development
- Good performance with compiled Dart
- Rich widget library
- Strong null safety

## 2. Why Riverpod? (vs BLoC, Provider, GetX)
**Decision:** Use Riverpod
**Reason:**
- Compile-safe (no runtime errors)
- Easy to test and mock
- No need for BuildContext everywhere
- Better dependency injection
- Good for complex state management
- Type-safe providers
- Better for future features (family providers, auto-dispose)

**Comparison Table:**
| Feature | Riverpod | BLoC | Provider | GetX |
|---------|----------|------|----------|------|
| Compile-safe | ✅ | ❌ | ❌ | ❌ |
| No BuildContext needed | ✅ | ❌ | ❌ | ✅ |
| Easy testing | ✅ | Medium | Hard | Easy |
| Learning curve | Medium | High | Low | Low |
| Type safety | ✅ | ✅ | ❌ | ❌ |

## 3. Why Drift? (vs Hive, sqflite, Isar)
**Decision:** Use Drift (formerly Moor)
**Reason:**
- Type-safe SQL queries
- Built on SQLite (proven, reliable)
- Complex queries with joins
- Migrations handled well
- Reactive streams for UI updates
- Better for relational data (tasks ↔ locations ↔ contacts)

## 4. Why Offline-First Architecture?
**Decision:** Local-first, sync optional
**Reason:**
- Always works (planes, subway, rural areas)
- Better user experience (instant response)
- No server costs initially
- Privacy (data stays on device)
- Can add sync later as premium feature

## 5. Folder Architecture Pattern
**Decision:** Feature-first structure
**Reason:**
- Scales better as app grows
- Each feature is independent
- Easy to add/remove features
- Clear separation of concerns

**Structure:**