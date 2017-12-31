enum NotificationSeverity {
  danger,
  warning,
  success,
  info,
  invisible
}

class Notification {
  final String message;
  final NotificationSeverity severity;

  Notification({
    this.message: ' ',
    this.severity: NotificationSeverity.danger
  });
}