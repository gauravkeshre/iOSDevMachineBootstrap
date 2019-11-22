## Xcode

### Render Alignment Rects for UIView

> Source: http://stackoverflow.com/a/21407408/751026

Although, you have the tool to visually debug View heirarchy, you will sometimes want some background to see your uiviews at runtime. Instead of changing background color of views in code or debugger, you can simply enable this flag as:

1. command + shift + i
2. Select Run|Debug > Arguments
3. Add a new `Arguments Passed on Launch`
4. paste `-UIViewShowAlignmentRects YES`
5. run.

### Keep older version of xcode handy

Always keep one older version of xcode before you update to new.

To distinguish the two instances of Xcode, you can change the icon of the old one (or new one) to orange icon.

You can find this icon under `Other Resources > orange_xcode_icon.png`