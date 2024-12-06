# Pure UI Kit

A Flutter UI kit inspired by Tailwind CSS, providing elegant and customizable components for your applications.



## Features

Pure UI Kit currently offers:

- Elegant and customizable "Empty State" components
  - Simple version with title, description, and action button

![Empty State Simple](assets/images/empty_state_simple.png)

  - Dashed border version for drop zones or add areas

![Empty State with Dashed Border](assets/images/empty_state_dashed.png)

## Installation

Add Pure UI Kit to your `pubspec.yaml` file:

```yaml
dependencies:
  pure_ui_kit: ^0.0.1
```

## Usage

### Simple Empty State

```dart
PureEmptyState.simple(
  title: 'No projects',
  description: 'Start by creating a new project.',
  buttonText: 'New Project',
  onPressed: () {
    // Action on button click
  },
);
```

### Empty State with Dashed Border

```dart
PureEmptyState.withDashedBorder(
  title: 'Create a new database',
  onPressed: () {
    // Action on click
  },
);
```

### Theme Customization

You can customize the appearance of the components using `PureTheme`:

```dart
PureTheme(
  emptyStateTheme: const PureEmptyStateTheme(
    titleStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.indigo,
    ),
    iconColor: Colors.indigo,
    dashedBorderColor: Colors.indigo,
  ),
  child: MaterialApp(
    // Your application
  ),
);
```

## Coming Soon

New components will be added soon, including:

- Buttons
- Form fields
- Cards
- Alerts
- And much more!

## Contribution

Contributions are welcome! Feel free to:

1. Fork the project
2. Create a branch for your feature
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

