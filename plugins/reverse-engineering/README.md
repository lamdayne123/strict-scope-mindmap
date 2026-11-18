# Plugin: strict-scope-reverse-engineering

Evidence-backed binary, bytecode, APK, .NET assembly, and network protocol inspection tools.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `REA (Reverse Engineer Anything)` | Unified MCP/CLI orchestration for binaries, JS/Electron, APKs, and captures |
| `Ghidra / IDA / Binary Ninja / Rizin / radare2` | Native disassembly, decompilation, and CFG analysis |
| `CFR / Vineflower / Bytecode Viewer / javap` | JVM bytecode decompilation and class structure inspection |
| `JADX / apktool` | Android APK/DEX decompilation and resource decoding |
| `.NET ILSpy / dnSpyEx / dotPeek / monodis` | .NET managed assembly CIL and metadata inspection |
| `Frida` | Authorized dynamic instrumentation and runtime tracing |
| `Wireshark / tshark / mitmproxy / tcpdump` | Packet capture and HTTP(S) protocol analysis |
| `Binwalk / Detect It Easy` | Firmware extraction and binary packing/signature identification |
| `GDB / LLDB / strace / lsof` | Native crash triage and syscall/process inspection |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
