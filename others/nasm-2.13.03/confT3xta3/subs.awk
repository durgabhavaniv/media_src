BEGIN {
S["LTLIBOBJS"]=""
S["LIBOBJS"]=""
S["CC_RANLIB"]=""
S["CC_AR"]=""
S["PDFOPT"]=""
S["STRIP"]="strip"
S["RANLIB"]="ranlib"
S["AR"]="ar"
S["XMLTO"]="false"
S["ASCIIDOC"]="false"
S["NROFF"]="nroff"
S["LIBEXT"]="a"
S["INSTALL_DATA"]="${INSTALL} -m 644"
S["INSTALL_SCRIPT"]="${INSTALL}"
S["INSTALL_PROGRAM"]="${INSTALL}"
S["SET_MAKE"]=""
S["LN_S"]="ln -s"
S["EGREP"]="/usr/bin/grep -E"
S["GREP"]="/usr/bin/grep"
S["CPP"]="gcc -E"
S["OBJEXT"]="o"
S["EXEEXT"]=""
S["ac_ct_CC"]="gcc"
S["CPPFLAGS"]=""
S["LDFLAGS"]="-L/opt/media/lib -L/opt/media/lib64"
S["CFLAGS"]="-g -O3 -fwrapv -U__STRICT_ANSI__ -fno-common -Werror=attributes -W -Wall -pedantic -Wno-long-long -Werror=implicit -Werror=missing-braces -Werror=re"\
"turn-type -Werror=trigraphs -Werror=pointer-arith -Werror=missing-prototypes -Werror=missing-declarations -Werror=comment -Werror=vla"
S["CC"]="gcc -std=gnu99"
S["ac_prefix_program"]=""
S["target_alias"]=""
S["host_alias"]=""
S["build_alias"]=""
S["LIBS"]=""
S["ECHO_T"]=""
S["ECHO_N"]="-n"
S["ECHO_C"]=""
S["DEFS"]="-DHAVE_CONFIG_H"
S["mandir"]="${datarootdir}/man"
S["localedir"]="${datarootdir}/locale"
S["libdir"]="${exec_prefix}/lib"
S["psdir"]="${docdir}"
S["pdfdir"]="${docdir}"
S["dvidir"]="${docdir}"
S["htmldir"]="${docdir}"
S["infodir"]="${datarootdir}/info"
S["docdir"]="${datarootdir}/doc/${PACKAGE}"
S["oldincludedir"]="/usr/include"
S["includedir"]="${prefix}/include"
S["localstatedir"]="${prefix}/var"
S["sharedstatedir"]="${prefix}/com"
S["sysconfdir"]="${prefix}/etc"
S["datadir"]="${datarootdir}"
S["datarootdir"]="${prefix}/share"
S["libexecdir"]="${exec_prefix}/libexec"
S["sbindir"]="${exec_prefix}/sbin"
S["bindir"]="${exec_prefix}/bin"
S["program_transform_name"]="s,x,x,"
S["prefix"]="/opt/media"
S["exec_prefix"]="${prefix}"
S["PACKAGE_URL"]=""
S["PACKAGE_BUGREPORT"]=""
S["PACKAGE_STRING"]=""
S["PACKAGE_VERSION"]=""
S["PACKAGE_TARNAME"]=""
S["PACKAGE_NAME"]=""
S["PATH_SEPARATOR"]=":"
S["SHELL"]="/bin/sh"
  for (key in S) S_is_set[key] = 1
  FS = ""

}
{
  line = $ 0
  nfields = split(line, field, "@")
  substed = 0
  len = length(field[1])
  for (i = 2; i < nfields; i++) {
    key = field[i]
    keylen = length(key)
    if (S_is_set[key]) {
      value = S[key]
      line = substr(line, 1, len) "" value "" substr(line, len + keylen + 3)
      len += length(value) + length(field[++i])
      substed = 1
    } else
      len += 1 + keylen
  }

  print line
}

