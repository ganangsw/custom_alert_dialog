# CustomAlert Flutter

## Overview
CustomAlert is a Flutter package that provides functions to display alert dialogs with different types and configurations, such as success, error, warning, info, confirm, and loading alerts.

## Features
 - Display alerts with icons corresponding to the alert type.
 - Customize text appearance, background color, and text color as needed.
 - Provide options for confirmation, cancellation, and additional buttons.
 - Dialog can be dismissed by tapping outside of it (optional).
 - Suitable for Flutter applications needing customizable alert dialogs.

## Getting Started

Import it in your dart code, you can use:

```dart
import 'package:your_package_name/custom_alert.dart';
```

Here are some examples demonstrating how to use CustomAlert in your Flutter application:

### Displaying Success Alert

```dart
CustomAlert.show(
  context,
  AlertType.success,
  'Success',
  'Operation completed successfully.',
);
```

### Displaying Confirmation Alert

```dart
CustomAlert.show(
  context,
  AlertType.confirm,
  'Confirmation',
  'Are you sure you want to proceed?',
  onConfirm: () {
  // Handle confirm action
  },
  onCancel: () {
  // Handle cancel action
  },
);
```

### Displaying Loading Alert
```dart
CustomAlert.show(
  context,
  AlertType.loading,
  'Loading',
  'Please wait...',
  backgroundColor: Colors.redAccent,
);
```

### Displaying Error Alert
```dart
CustomAlert.show(
  context,
  AlertType.error,
  'Error',
  'An error occurred.',
  backgroundColor: Colors.redAccent,
);
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
