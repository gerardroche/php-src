dnl $Id$

PHP_ARG_ENABLE(sysvmsg,whether to enable System V IPC support,
[  --enable-sysvmsg        Enable sysvmsg support])

if test "$PHP_SYSVMSG" != "no"; then
  AC_MSG_CHECKING([whether sys/msg.h defines struct msgbuf or mymsg])
  AC_TRY_COMPILE(
   [#include <sys/types.h>
    #include <sys/ipc.h>
    #include <sys/msg.h>],
   [size_t i;

     i = sizeof(struct msgbuf);
    return 1;],
   [AC_MSG_RESULT(msgbuf)],
   [AC_TRY_COMPILE(
     [#include <sys/types.h>
      #include <sys/ipc.h>
      #include <sys/msg.h>
     ],
     [size_t i;

     i = sizeof(struct mymsg);
      return 1;
     ],
     [AC_DEFINE(msgbuf, mymsg, [msgbuf is called mymsg])
      AC_MSG_RESULT(mymsg)
     ],
     [AC_MSG_ERROR([none. Cannot make sysvmsg module])
     ])
   ])
  AC_DEFINE(HAVE_SYSVMSG, 1, [ ])
  PHP_NEW_EXTENSION(sysvmsg, sysvmsg.c, $ext_shared)
fi
