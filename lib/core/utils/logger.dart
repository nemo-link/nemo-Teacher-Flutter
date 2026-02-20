import 'dart:developer';

class Logger {
  static void v(String message) {
    log('[VERBOSE] $message');
  }

  static void i(String message) {
    log('[INFO] $message');
  }

  static void d(String message) {
    log('[DEBUG] $message');
  }

  static void w(String message) {
    log('[WARNING] $message');
  }

  static void e(String message) {
    log('[ERROR] $message');
  }
}