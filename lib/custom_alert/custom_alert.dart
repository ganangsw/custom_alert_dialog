import 'package:flutter/material.dart';

/// Enum to determine the type of alert to display.
enum AlertType {
  success, // For success alerts
  error, // For error alerts
  warning, // For warning alerts
  info, // For information alerts
  confirm, // For confirmation alerts
  loading, // For loading alerts
}

/// Class to display custom alerts in a Flutter application.
class CustomAlert {
  /// Displays an alert dialog based on the provided parameters.
  ///
  /// - [context]: The context of the application where the dialog will be shown.
  /// - [type]: The type of alert to display (success, error, warning, info, confirm, loading).
  /// - [title]: The title of the alert.
  /// - [message]: The message to display in the alert.
  /// - [onConfirm]: Function called when the confirm button is pressed.
  /// - [onCancel]: Function called when the cancel button is pressed (only for confirm type alerts).
  /// - [titleStyle]: Text style for the alert title.
  /// - [messageStyle]: Text style for the alert message.
  /// - [backgroundColor]: Background color of the alert dialog.
  /// - [titleColor]: Text color for the alert title.
  /// - [messageColor]: Text color for the alert message.
  /// - [barrierDismissible]: Whether the dialog can be dismissed by tapping outside of it.
  /// - [semanticsLabel]: Semantic label for the dialog.
  /// - [confirmButtonText]: Text for the confirm button (default: 'OK').
  /// - [cancelButtonText]: Text for the cancel button (only for confirm type alerts, default: 'Cancel').
  /// - [additionalButtons]: List of additional widget buttons to add to the dialog.
  static void show(
    BuildContext context,
    AlertType type,
    String title,
    String message, {
    Function()? onConfirm,
    Function()? onCancel,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    bool barrierDismissible = true,
    String? semanticsLabel,
    String confirmButtonText = 'OK',
    String cancelButtonText = 'Cancel',
    List<Widget>? additionalButtons,
  }) {
    assert(title.isNotEmpty, 'Title cannot be empty');
    assert(message.isNotEmpty, 'Message cannot be empty');

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor ?? Theme.of(context).dialogBackgroundColor,
          title: Row(
            children: [
              _getIcon(type),
              const SizedBox(width: 10),
              Text(
                title,
                style: titleStyle ?? TextStyle(color: titleColor),
              ),
            ],
          ),
          content: Text(
            message,
            style: messageStyle ?? TextStyle(color: messageColor),
          ),
          actions: type == AlertType.loading
              ? []
              : _getActions(context, type, onConfirm, onCancel, confirmButtonText, cancelButtonText, additionalButtons),
          semanticLabel: semanticsLabel,
        );
      },
    );
  }

  /// Gets the icon widget based on the alert type.
  ///
  /// - [type]: The type of alert for which to retrieve the icon.
  /// - Returns the appropriate icon widget based on the alert type.
  static Widget _getIcon(AlertType type) {
    switch (type) {
      case AlertType.success:
        return const Icon(Icons.check_circle, color: Colors.green);
      case AlertType.error:
        return const Icon(Icons.error, color: Colors.red);
      case AlertType.warning:
        return const Icon(Icons.warning, color: Colors.orange);
      case AlertType.info:
        return const Icon(Icons.info, color: Colors.blue);
      case AlertType.confirm:
        return const Icon(Icons.help, color: Colors.grey);
      case AlertType.loading:
        return const CircularProgressIndicator();
      default:
        return Container();
    }
  }

  /// Gets the list of action button widgets for the alert dialog.
  ///
  /// - [context]: The context of the application where the dialog is shown.
  /// - [type]: The type of alert for which to retrieve the action buttons.
  /// - [onConfirm]: Function called when the confirm button is pressed.
  /// - [onCancel]: Function called when the cancel button is pressed.
  /// - [confirmButtonText]: Text for the confirm button.
  /// - [cancelButtonText]: Text for the cancel button.
  /// - [additionalButtons]: List of additional widget buttons to add to the dialog.
  /// - Returns the list of widget action buttons based on the alert type.
  static List<Widget> _getActions(
    BuildContext context,
    AlertType type,
    Function()? onConfirm,
    Function()? onCancel,
    String confirmButtonText,
    String cancelButtonText,
    List<Widget>? additionalButtons,
  ) {
    List<Widget> actions = additionalButtons ?? [];

    if (type == AlertType.confirm) {
      actions.add(
        TextButton(
          child: Text(cancelButtonText),
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) onCancel();
          },
        ),
      );
      actions.add(
        TextButton(
          child: Text(confirmButtonText),
          onPressed: () {
            Navigator.of(context).pop();
            if (onConfirm != null) onConfirm();
          },
        ),
      );
    } else {
      actions.add(
        TextButton(
          child: Text(confirmButtonText),
          onPressed: () {
            Navigator.of(context).pop();
            if (onConfirm != null) onConfirm();
          },
        ),
      );
    }
    return actions;
  }
}
