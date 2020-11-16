# iOS Practice
Open iOSPractice.xcworkspace instead of iOSPractice.xcodeproj

## Networking Diagram
Work in progress

![GetService] (/Documentation/GetService.png)

## SwiftLint
We use [SwiftLint](https://github.com/realm/SwiftLint) to enforce Swift style and conventions.

By default, SwiftLint automatically runs on build and it will alert any style violations. It will not, however, make modifications to the file unless you run SwiftLint autocorrect.
### Running SwiftLint autocorrect
*   From the project root directory, run

    `./Pods/SwiftLint/swiftlint autocorrect`

    This command will run autocorrect on **_ALL FILES_** in the project.

    Use `--path` option if you want to run autocorrect only on your files or directory. For example,

    `./Pods/SwiftLint/swiftlint autocorrect --path source/model/MyModel.swift`


* If you get **_Illegal hardware instruction error_**, make sure Xcode is installed in `/Application` folder and run
    
    `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`
    
* Some violations **_WILL NOT_** be fixed on autocorrect. These violations will need to be fixed manually.

    If you want to see the full list of rules that are correctable, run `./Pods/SwiftLint/swiftlint rules`