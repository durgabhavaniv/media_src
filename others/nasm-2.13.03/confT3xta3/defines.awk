BEGIN {
D["PACKAGE_NAME"]=" \"\""
D["PACKAGE_TARNAME"]=" \"\""
D["PACKAGE_VERSION"]=" \"\""
D["PACKAGE_STRING"]=" \"\""
D["PACKAGE_BUGREPORT"]=" \"\""
D["PACKAGE_URL"]=" \"\""
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_STRING_H"]=" 1"
D["HAVE_MEMORY_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["__EXTENSIONS__"]=" 1"
D["_ALL_SOURCE"]=" 1"
D["_GNU_SOURCE"]=" 1"
D["_POSIX_PTHREAD_SEMANTICS"]=" 1"
D["_TANDEM_SOURCE"]=" 1"
D["restrict"]=" __restrict"
D["WORDS_LITTLEENDIAN"]=" 1"
D["STDC_HEADERS"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE__BOOL"]=" 1"
D["HAVE_STDBOOL_H"]=" 1"
D["HAVE_STDNORETURN_H"]=" 1"
D["HAVE_FCNTL_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_SYS_PARAM_H"]=" 1"
D["HAVE_SYS_MMAN_H"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STRCASECMP"]=" 1"
D["HAVE_STRNCASECMP"]=" 1"
D["HAVE_STRSEP"]=" 1"
D["HAVE_STRNLEN"]=" 1"
D["HAVE_GETUID"]=" 1"
D["HAVE_GETGID"]=" 1"
D["HAVE_REALPATH"]=" 1"
D["HAVE_CANONICALIZE_FILE_NAME"]=" 1"
D["HAVE_PATHCONF"]=" 1"
D["HAVE_FSEEKO"]=" 1"
D["HAVE_FTRUNCATE"]=" 1"
D["HAVE_FILENO"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_SYS_PARAM_H"]=" 1"
D["HAVE_GETPAGESIZE"]=" 1"
D["HAVE_MMAP"]=" 1"
D["HAVE_GETPAGESIZE"]=" 1"
D["HAVE_SYSCONF"]=" 1"
D["HAVE_ACCESS"]=" 1"
D["HAVE_FACCESSAT"]=" 1"
D["HAVE___BUILTIN_CLZ"]=" 1"
D["HAVE___BUILTIN_CLZL"]=" 1"
D["HAVE___BUILTIN_CLZLL"]=" 1"
D["HAVE___BUILTIN_EXPECT"]=" 1"
D["HAVE_VSNPRINTF"]=" 1"
D["HAVE_SNPRINTF"]=" 1"
D["HAVE_STRUCT_STAT"]=" 1"
D["HAVE_STAT"]=" 1"
D["HAVE_FSTAT"]=" 1"
D["HAVE_DECL_STRCASECMP"]=" 1"
D["HAVE_DECL_STRICMP"]=" 0"
D["HAVE_DECL_STRNCASECMP"]=" 1"
D["HAVE_DECL_STRNICMP"]=" 0"
D["HAVE_DECL_STRSEP"]=" 1"
D["HAVE_DECL_STRLCPY"]=" 0"
D["HAVE_DECL_STRNLEN"]=" 1"
D["HAVE_UINTPTR_T"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_NORETURN"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_MALLOC"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_ALLOC_SIZE"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_FORMAT"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_CONST"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_PURE"]=" 1"
D["HAVE_FUNC_ATTRIBUTE_ERROR"]=" 1"
  for (key in D) D_is_set[key] = 1
  FS = ""
}
/^[\t ]*#[\t ]*(define|undef)[\t ]+[_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]*([\t (]|$)/ {
  line = $ 0
  split(line, arg, " ")
  if (arg[1] == "#") {
    defundef = arg[2]
    mac1 = arg[3]
  } else {
    defundef = substr(arg[1], 2)
    mac1 = arg[2]
  }
  split(mac1, mac2, "(") #)
  macro = mac2[1]
  prefix = substr(line, 1, index(line, defundef) - 1)
  if (D_is_set[macro]) {
    # Preserve the white space surrounding the "#".
    print prefix "define", macro P[macro] D[macro]
    next
  } else {
    # Replace #undef with comments.  This is necessary, for example,
    # in the case of _POSIX_SOURCE, which is predefined and required
    # on some systems where configure will not decide to define it.
    if (defundef == "undef") {
      print "/*", prefix defundef, macro, "*/"
      next
    }
  }
}
{ print }
