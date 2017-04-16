#!/bin/sh
# Generate "indent-c", to indent C files

# Header
echo '#!/bin/sh'
echo '# Indent C files'
echo '# This file has been automatically generated by '$(basename $0)
echo '# DO NOT EDIT'
echo ''
echo "exec indent \\"

# Options, from Kernighan & Ritchie style with some customisations:
sed 's/^\(-[^ ]*\) .*/    \1 \\/' << EOF
-nbad Do not force blank lines after declarations
-bap  Force blank lines after procedure bodies
-bbo  Prefer to break long lines before boolean operators
-nbc  Do not force newlines after commas in declarations
-br   Put braces on function definition line
-brs  Put braces on struct declaration line
-c0  Put comments to the right of code in column 0
-cd0 Put comments to the right of the declarations in column 0
-ncdb Do not put comment delimiters on blank lines
-ce   Cuddle else and preceding '}'
-ci4  Continuation indent of 4 spaces
-cli4 Case label indent of 4 spaces
-cp0  Put comments to the right of #else and #endif statements in column 0
-ncs  Do not put a space after cast operators
-d0   Set indentation of comments not to the right of code to 0 spaces
-di1  Put variables in column 1
-nfc1 Do not format comments in the first column
-nfca Disable all formatting of comments
-hnl  Prefer to break long lines at the position of newlines in the input
-i4   Set indentation level to 4 spaces
-il0  Set offset for labels to column 0
-ip0  Indent parameter types in old-style function definitions by 0 spaces
-l120 Set maximum line length for non-comment lines to 120
-lp   Line up continued lines at parentheses
-npcs Do not put space after the function in function calls
-npro Do not read '.indent.pro' files
-nprs Do not put a space after every '(' and before every ')'
-npsl Put the type of a procedure on the same line as its name
-ppi4 Indent preprocessor conditional statements by 4 spaces
-saf  Put a space after each for
-sai  Put a space after each if
-saw  Put a space after each while
-nsc  Do not put the '*' character at the left of comments
-sob  Swallow optional blank lines
-nss  Do not force a space before the semicolon after certain statements
-nut  Use spaces instead of tabs
-ts1  Set tab size to 1 space (for comment on the right of line)
EOF

# Moreover, -T is needed to tell indent about some typedefs
sed 's/^\([^ ]*\).*/    -T \1 \\/' << END-OF-TYPES
BOOL
BYTE
CHAR16
DWORD
DWORD64
DWORD_PTR
EFI_GUID
EFI_HANDLE
EFI_LOADED_IMAGE
EFI_STATUS
EFI_SYSTEM_TABLE
ENUM_WIN_INFOS_LPARAM
EXCEPTION_POINTERS
Elf_Dyn
Elf_Ehdr
Elf_Phdr
Elf_Shdr
Elf_Sym
Elf_Verdaux
Elf_Verdef
Elf_Word
Elf_auxv_t
GdkEventButton
GdkEventExpose
GdkScreen
GtkWidget
GtkWindow
HANDLE
HINSTANCE
HLOCAL
HMODULE
HWND
IEnumWbemClassObject
IUnknown
IWbemClassObject
IWbemServices
LONG
LPARAM
LPCSTR
LPCTSTR
LPCVOID
LPCWSTR
LPOSVERSIONINFO
LPTHREAD_START_ROUTINE
LPTSTR
LPVOID
OLECHAR
PBYTE
PDWORD
PIMAGE_DOS_HEADER
PIMAGE_EXPORT_DIRECTORY
PIMAGE_NT_HEADERS
PNT_TIB
PSHORT
PTOKEN_ELEVATION
PTOKEN_ELEVATION_TYPE
PTOKEN_GROUPS
PTOKEN_OWNER
PTOKEN_PRIMARY_GROUP
PTOKEN_PRIVILEGES
PTOKEN_SOURCE
PTOKEN_TYPE
PTOKEN_USER
PULONG
PVOID
PWORD
TCHAR
TEB_internal
UINT
UINT32
UINTN
UINT_PTR
ULONG
ULONG_PTR
UNICODE_STRING
VARIANT
WORD
asm_instr_context
asm_instr_reg
cairo_t
cpu_set_t
greg_t
int16_t
int32_t
int64_t
int8_t
intptr_t
mqd_t
off_t
pa_mainloop_api
pa_proplist
pa_signal_event
pa_stream
pa_stream_flags_t
pa_time_event
pid_t
siginfo_t
size_t
ssize_t
time_t
ucontext_t
uint16_t
uint32_t
uint64_t
uint8_t
uintptr_t
uname_t
END-OF-TYPES

# end the command with command line parameters
echo '    "$@"'
