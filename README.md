# Inget - Simple Note Taking App

<div align="center">
  <img src="assets/app_icon.png" alt="Inget Logo" width="100"/>
  <h3>Remember Everything, Anytime</h3>
</div>

## 📝 About

Inget is a minimalist note-taking app built with Flutter that helps you capture your thoughts
quickly and efficiently. With its clean interface and intuitive design, managing your notes has
never been easier.

### ✨ Features

- 📱 Clean and intuitive interface
- 📝 Create, edit, and delete notes
- 📋 Quick copy note content
- 🎨 Modern Material Design
- 💾 Offline storage capability
- 🚀 Fast and lightweight

## 📲 Installation

Download the APK that matches your device's architecture:

| Architecture | APK File                                                                     | Description                              |
| ------------ | ---------------------------------------------------------------------------- | ---------------------------------------- |
| ARM64-v8a    | [Download arm64-v8a](../../releases/latest/download/inget-arm64-v8a.apk)     | For most modern Android devices (64-bit) |
| Armeabi-v7a  | [Download armeabi-v7a](../../releases/latest/download/inget-armeabi-v7a.apk) | For older Android devices (32-bit)       |
| x86_64       | [Download x86_64](../../releases/latest/download/inget-x86_64.apk)           | For Android emulators (64-bit)           |
| x86          | [Download x86](../../releases/latest/download/inget-x86.apk)                 | For Android emulators (32-bit)           |
| Universal    | [Download universal](../../releases/latest/download/inget-universal.apk)     | Works on all devices (larger size)       |

### 🔍 How to Know Your Device Architecture

1. Install [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64) from Play
   Store
2. Open the app and check "System -> CPU" section
3. Look for "CPU Architecture" or "Instruction Set"
4. Download the matching APK from the table above

## 🚀 Getting Started

1. Download the appropriate APK for your device
2. Allow installation from unknown sources in your device settings
3. Install the APK
4. Start creating notes!

### 📱 Using the App

1. **Create Note**

   - Tap the + button
   - Enter title and content
   - Tap Create

2. **Edit Note**

   - Long press on a note
   - Select Edit
   - Modify content
   - Tap Save

3. **Delete Note**

   - Long press on a note
   - Select Delete
   - Confirm deletion

4. **Copy Note**
   - Tap on any note to copy its content
   - Content is copied to clipboard

## 🛠️ Technical Details

Built with:

- Flutter
- Riverpod for state management
- SharedPreferences for local storage
- Material 3 Design

## 📄 License

```
MIT License

Copyright (c) 2025 Inget

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
