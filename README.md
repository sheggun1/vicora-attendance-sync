# VICORA Attendance Sync — v0.2 development build

Offline-first Electron attendance manager. This build adds staff status management, basic daily attendance calculations, a report screen, and Excel export.

## Features
- Local SQLite storage
- Excel/CSV import, duplicate protection, and import history
- Staff directory; deactivate/reactivate staff without deleting records
- Daily summary: present/absent, late, early departure
- First/last attendance event per staff/day
- Daily Excel report and full-record CSV export
- Configurable start time, grace period, end time and workdays text

## Run
Requires Node.js and npm:
1. Extract this folder.
2. Run `npm install`
3. Run `npm start`

## Important limitations / next work
- A sample A12 export has not been provided yet; import column matching is generic and needs validation against the actual export.
- The current daily report treats every active staff member as expected on any date. Workday/holiday/leave logic is not yet implemented.
- Late time is calculated after configured start + grace period. Early departure is based on the last event and configured closing time. Attendance machines may record multiple fingerprint events; the app currently uses first and last.
- No A12 LAN/TCP protocol has been confirmed; direct network sync is not included.
- USB auto-detection is not included yet; import is file-picker based.
- No cloud sync, payroll, leave-management, or biometric-template handling.


## v0.3.0 - Removable USB auto-import (Windows)

- Polls Windows removable drives every 10 seconds using PowerShell removable-drive enumeration.
- Looks for Excel/CSV attendance exports at the drive root and common Attendance/attend/Record folders.
- Automatically imports recognized files; creates staff records from imported IDs/names.
- Uses file SHA-256 tracking to avoid repeatedly importing an unchanged export.
- Keeps row-level attendance uniqueness (staff ID + timestamp) to protect against duplicate logs.
- Shows an in-app notification after auto-import.

**Limitations:** the exact A12 export layout has not been tested because no sample export has been provided. The importer currently uses header matching for staff ID/name and timestamp columns. USB auto-detection is Windows-only and requires PowerShell. Files placed in other USB subfolders will not be scanned yet.


## v0.4 — A12 LAN diagnostics
- Adds an A12 Network page with IP and TCP reachability tests for common ports (4370, 80, 443, 8080, 8000, 5005).
- Diagnostic tests are read-only and do not alter device settings or send attendance commands.
- Port 4370 is only a common biometric-device port; the A12 protocol is not yet verified. Open-port detection is not protocol confirmation.
- USB attendance-file import remains the supported synchronization path until a sample export and device protocol are verified.
