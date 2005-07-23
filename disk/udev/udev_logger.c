#include <syslog.h>
#include <stdarg.h>

extern int udev_log_priority;

#ifdef USE_LOG
void log_message(int priority, const char *format, ...)
{
	va_list args;

	if (priority > udev_log_priority)
		return;

	va_start(args, format);
	vsyslog(priority, format, args);
	va_end(args);
}
#endif
