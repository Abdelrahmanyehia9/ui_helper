# ui_helper

A Flutter UI utility package with helpers, extensions, and widgets.

---

## Setup

```dart
import 'package:ui_helper/ui_helper.dart';
```

Wrap your app with `UISizesInit`:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UISizesInit(
      child: MaterialApp(
        navigatorKey: UINavigationService.navigatorKey,
        home: HomeScreen(),
      ),
    );
  }
}
```

---

## UISizes

```dart
Container(
  height: UISizes.h10,
  width: UISizes.w20,
  child: Text('hello', style: TextStyle(fontSize: UISizes.sp14)),
)

// or with extension
Container(height: 15.h, width: 33.w)
Text('hello', style: TextStyle(fontSize: 13.sp))
BorderRadius.circular(10.r)
```

---

## DateTime Extensions

```dart
DateTime.now().toDateOnly();
DateTime.now().time12Only(locale: 'ar');
DateTime.now().timeAgo();
DateTime.now().timeAgo(messages: TimeMessagesAr());
DateTime.now().isPast;
DateTime.now().isToday;
```

### Custom Language

```dart
class TimeMessagesFr implements TimeMessages {
  @override String get justNow => 'À l\'instant';
  @override String minutes(int n) => 'il y a $n minutes';
  @override String hours(int n) => 'il y a $n heures';
  @override String days(int n) => 'il y a $n jours';
  @override String weeks(int n) => 'il y a $n semaines';
  @override String months(int n) => 'il y a $n mois';
  @override String years(int n) => 'il y a $n ans';
}

DateTime.now().timeAgo(messages: TimeMessagesFr());
```

---

## Either

```dart
Either<String, Unit> save() => Right(unit);

Either<String, int> divide(int a, int b) {
  if (b == 0) return Left('Cannot divide by zero');
  return Right(a ~/ b);
}

divide(10, 2).fold(
  (error) => print(error),
  (value) => print(value),
);
```

---

## Widgets

### UIButton

```dart
UIButton.filled('Submit', onTap: () {}, isLoading: true)
UIButton.outlined('Cancel', onTap: () {}, borderColor: Colors.red)
UIButton.text('Skip', onTap: () {})
```

### UITextField

```dart
UITextField(
  hintText: 'Email',
  headerText: 'Email Address',
  keyboardType: TextInputType.emailAddress,
  validator: (v) => AppRegex.isValidEmail(v ?? '') ? null : 'Invalid email',
)
```

### UIGap

```dart
Column(
  children: [
    Text('Hello'),
    UIGap.small(),      // 8
    Text('World'),
    UIGap.medium(),     // 16
    UIGap.large(),      // 24
  ],
)
```

### UIChip

```dart
UIChip(title: 'Flutter', color: Colors.blue, monochromatic: true)
UIChip(title: 'Dart', onTap: () {})
```

### UICachedNetworkImage

```dart
UICachedNetworkImage('https://...', width: 100, height: 100, circular: true)
UICachedNetworkImage('https://...', radius: 12)
```

### UILogo

```dart
UILogo.svg(path: 'assets/logo.svg', size: 48)
UILogo.image(path: 'assets/logo.png', size: 48)
UILogo.iconData(icon: Icons.star, size: 48, color: Colors.amber)
```

### UIAppbar

```dart
UIAppbar(title: 'Home', actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})])
UIAppbar(title: Text('Custom Title'))
```

---

## Context Extensions

```dart
context.push(HomeScreen())
context.pop()
context.pushReplacement(LoginScreen())

context.primary
context.isDark
context.height
context.width
context.isRTL

context.showSnackBars(message: 'Hello', context: context)
context.successBar(message: 'Saved!', context: context)
context.errorBar(message: 'Failed!', context: context)
context.warningBar(message: 'Watch out!', context: context)
```

---

## Color Extensions

```dart
Colors.blue.lighten(0.2)
Colors.blue.darken(0.1)
Colors.blue.withAppOpacity(0.5)
Colors.blue.veryLight
Colors.blue.toHex
ColorExtension.fromHex('#FF5733')
```

---

## AppRegex

```dart
AppRegex.isValidEmail('test@mail.com')
AppRegex.isValidEgyptianNumber('01012345678')
AppRegex.isValidUsername('flutter_dev')
AppRegex.hasUpperCase('Password1')
AppRegex.hasNumber('Password1')
AppRegex.hasMinLength('pass')
```

---

## Navigation Service

```dart
MaterialApp(
  navigatorKey: UINavigationService.navigatorKey,
)

// anywhere without context
UINavigationService.navigator?.push(...)
UINavigationService.context
```