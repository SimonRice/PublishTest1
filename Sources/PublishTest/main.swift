import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct PublishTest: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://elastic-noyce-9e4c1d.netlify.com")!
    var name = "Netlify Publish Test"
    var description = "An example of John Sundell's Publish that has been published straight to Netlify with full build caching"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try PublishTest().publish(withTheme: .foundation)