# دليل تشغيل المشروع خطوة بخطوة (Windows)

الدليل ده بيمشيك من أول `git clone` لحد ما الأبلكيشن يفتح على الإيميوليتور أو الموبايل.

## 🔗 اللينكات

| | |
|---|---|
| صفحة المشروع على GitHub | https://github.com/gabal-ahmed/expense-tracker-flutter |
| لينك الـ Clone | `https://github.com/gabal-ahmed/expense-tracker-flutter.git` |
| تحميل ZIP (لو مش عايز تستخدم Git) | https://github.com/gabal-ahmed/expense-tracker-flutter/archive/refs/heads/main.zip |

> **مهم:** الأبلكيشن بيستخدم `sqflite` (قاعدة بيانات محلية)، فلازم يشتغل على **Android** (إيميوليتور أو موبايل).
> مش هيشتغل صح على Windows desktop أو Chrome.

---

## 1) البرامج المطلوبة (مرة واحدة بس)

| البرنامج | النسخة | التحميل |
|---|---|---|
| Git | أي نسخة حديثة | https://git-scm.com/download/win |
| Flutter SDK | **3.44.2** (أو 3.35 كحد أدنى) | https://docs.flutter.dev/get-started/install/windows/mobile |
| Android Studio | أحدث نسخة | https://developer.android.com/studio |

### تسطيب Flutter
1. نزّل Flutter SDK وفكّه في مسار قصير **من غير مسافات أو حروف عربي**، مثلاً: `C:\src\flutter`
2. ضيف `C:\src\flutter\bin` للـ **PATH**:
   - ابحث في Start عن *Edit the system environment variables* ← *Environment Variables*
   - في *User variables* اختار `Path` ← *Edit* ← *New* ← اكتب `C:\src\flutter\bin`
3. اقفل الـ terminal وافتحه تاني، وجرّب:
   ```
   flutter --version
   ```

### تسطيب Android Studio
1. سطّبه بالإعدادات الافتراضية (هينزّل Android SDK لوحده).
2. من **More Actions ← SDK Manager ← SDK Tools** علّم على:
   - Android SDK Command-line Tools
   - Android SDK Platform-Tools
3. من **Plugins** سطّب **Flutter** (وهيسطّب Dart معاه).
4. وافق على الـ licenses:
   ```
   flutter doctor --android-licenses
   ```
   (اضغط `y` لكل سؤال)

### اتأكد إن كله تمام
```
flutter doctor
```
لازم يبقى فيه ✓ قدام **Flutter** و **Android toolchain**. علامات تانية زي Visual Studio أو Chrome مش مهمة للمشروع ده.

---

## 2) تحميل المشروع

افتح PowerShell أو CMD في فولدر قصير (مثلاً `C:\projects`):

```
cd C:\projects
git clone https://github.com/gabal-ahmed/expense-tracker-flutter.git
cd expense-tracker-flutter
```

**أو من غير Git:** نزّل الـ ZIP من
https://github.com/gabal-ahmed/expense-tracker-flutter/archive/refs/heads/main.zip
وفكّه في `C:\projects`. هيطلعلك فولدر اسمه `expense-tracker-flutter-main`، ادخله بـ:
```
cd C:\projects\expense-tracker-flutter-main
```

**أو من Android Studio:** File ← New ← Project from Version Control ← حط اللينك
`https://github.com/gabal-ahmed/expense-tracker-flutter.git` ← Clone

> ⚠️ ماتحطش المشروع في مسار فيه مسافات أو عربي أو طويل جداً (زي Desktop جوه OneDrive). ده بيعمل مشاكل مع Gradle.

---

## 3) تنزيل الـ packages

```
flutter pub get
```

---

## 4) تجهيز جهاز Android

### اختيار (أ): إيميوليتور
1. Android Studio ← **More Actions ← Virtual Device Manager ← Create Device**
2. اختار موبايل (مثلاً Pixel 8) ← اختار System Image (أحدث API) ← Finish
3. شغّله بزرار ▶

أو من الـ terminal:
```
flutter emulators
flutter emulators --launch <emulator_id>
```

### اختيار (ب): موبايل حقيقي
1. على الموبايل: **Settings ← About phone** ← دوس على **Build number** 7 مرات
2. **Developer options ← USB debugging** ← فعّله
3. وصّل الموبايل بالكابل ووافق على رسالة *Allow USB debugging*

### اتأكد إن الجهاز ظاهر
```
flutter devices
```
لازم يظهر سطر فيه `emulator-5554` أو اسم موبايلك.

---

## 5) تشغيل الأبلكيشن

```
flutter run
```

لو فيه أكتر من جهاز، حدد الجهاز:
```
flutter run -d emulator-5554
```

> أول مرة هتاخد كام دقيقة لأن Gradle بينزّل حاجات من النت. **لازم يكون فيه نت.**
> المرات اللي بعد كده هتبقى أسرع بكتير.

### أوامر وانت شغال
| الزرار | الوظيفة |
|---|---|
| `r` | Hot reload (يطبّق تعديلاتك فوراً) |
| `R` | Hot restart |
| `q` | يقفل الأبلكيشن |

---

## 6) (اختياري) عمل APK تنزّله على أي موبايل

```
flutter build apk --release
```
الملف هيبقى في:
```
build\app\outputs\flutter-apk\app-release.apk
```
ابعته لأي موبايل أندرويد وسطّبه (هيطلب السماح بالتسطيب من مصادر غير معروفة).

---

## حل المشاكل الشائعة

| المشكلة | الحل |
|---|---|
| `'flutter' is not recognized` | الـ PATH مش متظبط. راجع خطوة تسطيب Flutter وافتح terminal جديد. |
| `No connected devices` | شغّل الإيميوليتور أو وصّل الموبايل، وبعدين `flutter devices`. |
| `flutter run` بيكتب `Downloading windows-x64...` أو بيسألك تختار Windows/Chrome | مفيش جهاز أندرويد شغال، فـ Flutter اختار Windows (والأبلكيشن مش هيشتغل عليه). اضغط `Ctrl+C`، شغّل الإيميوليتور أو وصّل الموبايل، اعمل `flutter devices` وخد الـ id، وبعدين `flutter run -d <id>` (مثلاً `flutter run -d emulator-5554`). |
| `Android license status unknown` | `flutter doctor --android-licenses` |
| `The method 'withValues' isn't defined` أو `initialValue` | نسخة Flutter قديمة. اعمل `flutter upgrade`. |
| Gradle بيفشل أو بيعلّق | اتأكد من النت، وبعدين: `flutter clean` ثم `flutter pub get` ثم `flutter run` |
| `flutter.sdk not set in local.properties` | شغّل `flutter pub get` جوه فولدر المشروع (بيعمل الملف لوحده). |
| مشاكل غريبة في المسار | انقل المشروع لمسار قصير من غير مسافات، مثلاً `C:\projects\expense-tracker-flutter` |

### الحل الشامل لو حاجة باظت
```
flutter clean
flutter pub get
flutter run
```

---

## ملخص سريع (لو كل حاجة متسطبة)
```
git clone https://github.com/gabal-ahmed/expense-tracker-flutter.git
cd expense-tracker-flutter
flutter pub get
flutter run
```
