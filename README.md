# CustomAlert Example App

This Flutter application demonstrates the usage of the `CustomAlert` class to display various types of alerts.

## Demo
<br>
<img src="https://raw.githubusercontent.com/ganangsw/custom_alert_dialog/main/screenshots/demo.gif?raw=true" alt="CustomAlert Demo">

## Overview

The `CustomAlert` class provides methods to show alert dialogs with different types such as success, error, warning, info, confirm, and loading alerts. Each alert type can be customized with specific styles and behaviors.

## Features

- **Multiple Alert Types**: Choose from success, error, warning, info, confirm, and loading alerts.
- **Customizable Appearance**: Customize the alert's title, message, background color, text color, and icon.
- **User Interaction**: Handle user actions with optional callbacks for confirm and cancel actions.
- **Accessibility**: Ensure accessibility with semantic labels and dismissible options.
- **Ease of Integration**: Easily integrate into any Flutter application for displaying alerts.

## Usage

To use `CustomAlert`, import the necessary libraries and call the `show` method with appropriate parameters based on the type of alert you want to display.

### Getting Started

Below are examples of how to use `CustomAlert` in your Flutter application:

#### Import CustomAlert

```dart
import 'package:flutter/material.dart';
import 'custom_alert.dart';  // Replace with your actual import path
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
