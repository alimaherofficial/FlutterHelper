## Prompt to Create UI Screens for a Feature in Flutter

### Instructions

You are an AI assistant tasked with generating UI screens for a new feature in Flutter. The screens should be responsive and adapt to different device sizes (mobile, tablet, and web) using the `AdaptiveLayout` widget. The generated code should be well-structured, maintainable, and testable.

### Requirements

1. **Main Screen**:
   - Create a main screen that uses the `AdaptiveLayout` widget to switch between mobile, tablet, and web layouts.
   - The main screen should be responsible for rendering the appropriate layout based on the device size.

2. **Mobile Layout**:
   - Create a mobile-specific layout for the feature.
   - Ensure that the layout is optimized for smaller screens.

3. **Tablet Layout**:
   - Create a tablet-specific layout for the feature.
   - Ensure that the layout is optimized for medium-sized screens.

4. **Web Layout**:
   - Create a web-specific layout for the feature.
   - Ensure that the layout is optimized for larger screens.

5. **Routing**:
   - Define the routes for the new feature in `app_router.dart`.
   - Use the paths defined in `app_paths.dart` for consistency.
   - If needed, create a wrapper similar to `ai_wrapper.dart` to manage state or dependencies.

### Example Structure

1. **Main Screen**:
   - `lib/features/feature_name/presentation/pages/feature_screen.dart`
   - Use `AdaptiveLayout` to switch between mobile, tablet, and web layouts.

2. **Mobile Layout**:
   - `lib/features/feature_name/presentation/pages/feature_screen_mobile.dart`
   - Implement the mobile-specific layout.

3. **Tablet Layout**:
   - `lib/features/feature_name/presentation/pages/feature_screen_tablet.dart`
   - Implement the tablet-specific layout.

4. **Web Layout**:
   - `lib/features/feature_name/presentation/pages/feature_screen_web.dart`
   - Implement the web-specific layout.

5. **Routing**:
   - `lib/config/routes/app_router.dart`
     - Define the routes for the new feature.
   - `lib/config/routes/app_paths.dart`
     - Add the paths for the new feature.

### Example Code

#### Main Screen

```dart
dart:lib/features/feature_name/presentation/pages/feature_screen.dart

import 'package:flutter/material.dart';
import 'package:fitspace_flutter/core/presentation/widgets/adaptive_layout.dart';
import 'package:fitspace_flutter/features/feature_name/presentation/pages/feature_screen_mobile.dart';
import 'package:fitspace_flutter/features/feature_name/presentation/pages/feature_screen_tablet.dart';
import 'package:fitspace_flutter/features/feature_name/presentation/pages/feature_screen_web.dart';
/// FeatureScreen is a StatelessWidget that is responsible for rendering the feature screen.
class FeatureScreen extends StatelessWidget {
/// Initializes the FeatureScreen class with the given [key].
const FeatureScreen({super.key});
@override
Widget build(BuildContext context) {
return AdaptiveLayout(
mobileLayout: (context) => const FeatureScreenMobile(),
tabletLayout: (context) => const FeatureScreenTablet(),
webLayout: (context) => const FeatureScreenWeb(),
);
}
}
```

#### Mobile Layout

```dart
dart:lib/features/feature_name/presentation/pages/feature_screen_mobile.dart
import 'package:flutter/material.dart';
/// FeatureScreenMobile is a StatelessWidget that is responsible for rendering the mobile layout of the feature screen.
class FeatureScreenMobile extends StatelessWidget {
/// Initializes the FeatureScreenMobile class with the given [key].
const FeatureScreenMobile({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Text('Feature Screen Mobile'),
),
);
}
}
```

#### Tablet Layout

```dart
dart:lib/features/feature_name/presentation/pages/feature_screen_tablet.dart
import 'package:flutter/material.dart';
/// FeatureScreenTablet is a StatelessWidget that is responsible for rendering the tablet layout of the feature screen.
class FeatureScreenTablet extends StatelessWidget {
/// Initializes the FeatureScreenTablet class with the given [key].
const FeatureScreenTablet({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Text('Feature Screen Tablet'),
),
);
}
}
```

#### Web Layout

```dart
dart:lib/features/feature_name/presentation/pages/feature_screen_web.dart
import 'package:flutter/material.dart';
/// FeatureScreenWeb is a StatelessWidget that is responsible for rendering the web layout of the feature screen.
class FeatureScreenWeb extends StatelessWidget {
/// Initializes the FeatureScreenWeb class with the given [key].
const FeatureScreenWeb({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Text('Feature Screen Web'),
),
);
}
}
```

#### Routing

#### Routing

```dart
dart:lib/config/routes/app_router.dart
import 'package:auto_route/auto_route.dart';
import 'package:fitspace_flutter/config/routes/app_paths.dart';
import 'package:fitspace_flutter/features/feature_name/presentation/pages/feature_screen.dart';
@AutoRouterConfig(
replaceInRouteName: 'Screen,Route',
)
/// AppRouter
class AppRouter extends RootStackRouter {
@override
final List<AutoRoute> routes = [
// ... other routes
AutoRoute(
page: FeatureScreen.page,
path: AppPaths.feature,
),
];
}
```

### Paths

```dart
dart:lib/config/routes/app_paths.dart
/// AppPaths
class AppPaths {
static const String feature = '/feature';
}
```


### Additional Notes

- Follow Dart and Flutter best practices.
- Ensure that the code is clean, readable, and well-documented.
- Use meaningful names for classes, methods, and variables.
- Avoid deeply nested structures and keep the widget tree shallow.

By following these instructions, you will create a robust and maintainable
UI flow for the new feature.