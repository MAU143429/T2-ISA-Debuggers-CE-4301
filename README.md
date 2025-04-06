
# T2 - Assembly Code Debugging CE-4301

---

## 📋 About the Project

This assignment focuses on debugging the **Pascal's Triangle** algorithm implemented in assembly language for different ISAs:

- **x86** (GDB)
- **RISCV** (rv8)
- **ARM** (QEMU + remote GDB)

Each architecture has its own source code in assembly.  
The goal is to observe the behavior of the registers during the execution of the algorithm using specific debuggers.

---

## 🚀 Usage Instructions

**Compile and debug:**

   - **x86:**
     ```bash
     nasm -f elf32 pascal.asm -o pascal.o
     ld -m elf_i386 pascal.o -o pascal
     gdb ./pascal
     ```

   - **RISCV:**
     ```bash
     riscv32-unknown-elf-as pascal.s -o pascal.o
     riscv32-unknown-elf-ld pascal.o -o pascal
     rv-jit -d pascal
     ```

   - **ARM:**
     ```bash
     arm-linux-gnueabi-as -o pascal.o pascal.s
     arm-linux-gnueabi-ld -o pascal pascal.o
     qemu-arm -g 1233 pascal
     # In another terminal
     gdb-multiarch
     (gdb) target remote :1233
     ```

---

## 🛠️ Tools Used

- **GDB** (x86)
- **rv8** (RISCV)
- **QEMU + remote GDB** (ARM)

---

## 📸 Evidence

The full documentation of the process, including screenshots of the debugging sessions, is available in the task report.

---
