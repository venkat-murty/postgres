/*-------------------------------------------------------------------------
 *
 * dynloader.c
 *	  dynamic loader for HP-UX using the shared library mechanism
 *
 * Portions Copyright (c) 1996-2015, PostgreSQL Global Development Group
 * Portions Copyright (c) 1994, Regents of the University of California
 *
 *
 * IDENTIFICATION
 *	  src/backend/port/dynloader/hpux.c
 *
 *	NOTES
 *		all functions are defined here -- it's impossible to trace the
 *		shl_* routines from the bundled HP-UX debugger.
 *
 *-------------------------------------------------------------------------
 */
#include "postgres.h"

/* System includes */
#include <a.out.h>
#include <dl.h>

#include "dynloader.h"
#include "utils/dynamic_loader.h"

void *
pg_dlopen(char *filename)
{	StackTrace("pg_dlopen");
	/*
	 * Use BIND_IMMEDIATE so that undefined symbols cause a failure return
	 * from shl_load(), rather than an abort() later on when we attempt to
	 * call the library!
	 */
	shl_t		handle = shl_load(filename,
								BIND_IMMEDIATE | BIND_VERBOSE | DYNAMIC_PATH,
								  0L);

	return (void *) handle;
}

PGFunction
pg_dlsym(void *handle, char *funcname)
{	StackTrace("pg_dlsym");
	PGFunction	f;

	if (shl_findsym((shl_t *) & handle, funcname, TYPE_PROCEDURE, &f) == -1)
		f = (PGFunction) NULL;
	return f;
}

void
pg_dlclose(void *handle)
{	StackTrace("pg_dlclose");
	shl_unload((shl_t) handle);
}

char *
pg_dlerror(void)
{	StackTrace("pg_dlerror");
	static char errmsg[] = "shl_load failed";

	if (errno)
		return strerror(errno);

	return errmsg;
}
