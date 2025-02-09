//
//  RichTextStyleReader.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-28.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented any types that can provide
 rich text style for the current rich text font.

 The protocol is implemented by `NSAttributedString` as well
 as other types in the library. It provides any implementing
 types with convenient extensions.
 */
public protocol RichTextStyleReader: RichTextFontReader {}

extension NSAttributedString: RichTextStyleReader {}

public extension RichTextStyleReader {

    /**
     Get the rich text styles at a certain range.

     - Parameters:
       - range: The range to get the traits from.
     */
    func richTextStyles(at range: NSRange) -> [RichTextStyle] {
        let attributes = richTextAttributes(at: range)
        let traits = font(at: range)?.fontDescriptor.symbolicTraits
        var styles = traits?.enabledRichTextStyles ?? []
        if attributes.isStrikethrough { styles.append(.strikethrough) }
        if attributes.isUnderlined { styles.append(.underlined) }
        return styles
    }
}
