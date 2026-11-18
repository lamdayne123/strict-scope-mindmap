# Plugin: strict-scope-browser-automation

Real-browser rendering, computed theme/layout verification, accessibility contrast auditing, and visual regression tools.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `Playwright` | Headless/headed browser automation and computed style inspection |
| `Puppeteer` | Chromium automation and screenshot/PDF capture |
| `Chrome DevTools Protocol (CDP)` | DOM, console error, network waterfall, and layout shift inspection |
| `Cypress / WebdriverIO / Selenium` | Interactive UI and cross-browser E2E testing |
| `Storybook` | Isolated component state and theme verification |
| `Chromatic / Percy / Applitools` | Visual regression and pixel/DOM diffing |
| `axe-core / Pa11y` | Automated WCAG accessibility and contrast ratio verification |
| `Lighthouse / WebPageTest` | Core Web Vitals, rendering performance, and quality audits |
| `Figma MCP / Penpot API` | Design token and layout specification inspection |
| `Stylelint / Tailwind CSS tooling / ESLint / Prettier` | CSS and frontend asset validation |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
