//
// .swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

@Observable
class ArticlesViewModel {
    
    var isLiked: Bool = false
    var selectedFilter: FieldOfInterest? = nil
    let tagModel: fieldOfInterestModel //Objet qui contient toutes les instances des tag
    var articlesArray: [Article]

    var articlesSlider: [Article] {
        return articlesArray.filter { $0.isOnSlider }
    }
    
    //propriété calculée :
    //filtrage (si un tag sélectionné)
   //tri par date (du plus récent au plus ancien)
    //retire les articles contenu dans articleSlider
    var filteredArticles: [Article] {
        let selected = selectedFilter
        let sliderArticles = Set(articlesSlider)

        let filtered: [Article]
        if let selected = selected {
            filtered = articlesArray.filter { $0.tag == selected }
        } else {
            filtered = articlesArray
        }

        return filtered
            .filter { !sliderArticles.contains($0) } // évite les doublons
            .sorted { $0.datePublication > $1.datePublication }
    }

    init() {
        self.tagModel = fieldOfInterestModel()
        
        self.articlesArray = [
            // CYBERSECURITY
            Article(
                titre: "Cyber Threats in 2025: What's Next?",
                intro: "A dive into the evolving landscape of cyber threats and defenses.",
                chapeau: "As technology advances, so do the methods of cybercriminals. This article explores current trends, expert insights, and inclusive approaches to cyber resilience.",
                tag: tagModel.cybersecurity,
                datePublication: "25 juillet 2025",
                imageCouv: "cyber-1",
                contentArticle: [
                    .subtitle1("Rising Threats"),
                    .paragraph1("In 2025, ransomware attacks have grown more sophisticated. Organizations across the globe report a sharp increase in targeted breaches, especially in the healthcare and education sectors. These industries hold sensitive data but often lack robust security infrastructures. Experts warn that zero-day vulnerabilities are now traded like commodities on the dark web. Cybercriminals are increasingly using AI to bypass traditional defenses. In response, security researchers are focusing on behavioral analysis and anomaly detection to outpace attackers. Public-private partnerships are also being encouraged to develop rapid response protocols. Inclusivity is critical in building cyber defenses, ensuring that underrepresented communities are also protected and educated about online threats. The rise of digital ID systems introduces both convenience and new risk vectors. Governments are grappling with how to implement strong privacy laws without hindering innovation. As work-from-anywhere continues, companies must rethink their perimeterless security strategies. SOC teams are adopting more decentralized approaches, and there's a push toward diversity in cybersecurity teams to bring a broader range of perspectives to threat modeling."),
                    .image("cyber-2"),
                    .subtitle1("Building Resilience"),
                    .paragraph2("Experts emphasize that technical defenses are not enough. Cyber hygiene, employee training, and inclusive outreach are equally vital. Companies are investing in simulations that reflect real-world diversity to test security scenarios more effectively. Open-source communities are playing a big role in sharing knowledge and tools, making cybersecurity more accessible. There's also a growing movement toward simplifying security tools to make them usable by small businesses and nonprofits. Initiatives like 'Cyber for All' aim to democratize knowledge and resources, particularly in low-income regions. Inclusion also means accounting for neurodiversity in user interfaces to reduce errors and improve compliance. Educational programs now often include diverse case studies and invite speakers from varied backgrounds. With cyber insurance premiums on the rise, proactive risk mitigation becomes not just smart but necessary. Ultimately, resilience requires collective responsibility, from engineers and designers to policymakers and users. By fostering inclusion at every layer of the ecosystem, we stand a better chance of staying ahead of threats.")
                ],
                isBig: false,
                isOnSlider: true
            ),
            Article(
                titre: "Inclusive Education for the Next Gen",
                intro: "Teaching cybersecurity to kids, teens, and non-tech audiences.",
                chapeau: "Cyber literacy starts early. Across the world, programs are making cybersecurity education more inclusive and engaging for all ages.",
                tag: tagModel.cybersecurity,
                datePublication: "22 juillet 2025",
                imageCouv: "cyber-3",
                contentArticle: [
                    .subtitle1("Starting Young"),
                    .paragraph1("In classrooms from Nairobi to Nantes, young students are learning how to identify phishing emails, create strong passwords, and understand data privacy. Educators are working with cybersecurity experts to make these lessons practical and culturally relevant. Games and simulations replace dry theory, allowing students to roleplay as ethical hackers or incident responders. Some countries are integrating basic cyber modules into national curriculums. Nonprofits are stepping in where schools lack resources, especially in underserved areas. There's a strong focus on reaching girls and marginalized youth to combat stereotypes. The idea is simple: make cybersecurity fun, relatable, and empowering. Projects like CyberGirls and HackTheGap offer mentorship, workshops, and safe spaces for learning."),
                    .image("cyber-4"),
                    .subtitle1("Beyond the Classroom"),
                    .paragraph2("Education isn’t limited to schools. Libraries, community centers, and online platforms are becoming hubs for cyber awareness. Senior citizens learn how to spot scams, while small business owners gain tools to secure their websites. Visual content and multilingual resources help bridge accessibility gaps. Some platforms are even exploring AI tutors to personalize cybersecurity learning. Governments are supporting public campaigns like 'Think Before You Click', while influencers use social media to spread good cyber hygiene habits. Cybersecurity is becoming a shared cultural competency—not just the job of IT professionals. And with more inclusive approaches, the digital world becomes safer for everyone.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Open-Source : A Community Defense",
                intro: "Why open-source projects are leading innovation in cybersecurity.",
                chapeau: "From Linux to Signal, open-source communities are proving that transparency and collaboration can outsmart cyber threats.",
                tag: tagModel.cybersecurity,
                datePublication: "20 juillet 2025",
                imageCouv: "cyber-5",
                contentArticle: [
                    .subtitle1("Transparent by Design"),
                    .paragraph1("Unlike proprietary software, open-source projects let anyone inspect their code. This transparency allows vulnerabilities to be spotted—and fixed—faster. Projects like OpenSSL and WireGuard thrive because of global communities of contributors. But it’s not just about code: open-source security is also about governance, inclusivity, and sustainable funding. In 2025, GitHub is prioritizing funding for diverse contributors and underfunded security projects. There’s also growing interest in 'open security operations centers'—virtual teams monitoring shared infrastructure for threats. The ethos is collective vigilance: security is a shared responsibility."),
                    .image("cyber-6"),
                    .subtitle1("Bridging the Gaps"),
                    .paragraph2("While open-source has strengths, it also faces challenges. Many projects still rely on volunteer labor, leading to burnout or delays in patching. That’s why tech giants are increasingly contributing back—by hiring maintainers, donating cloud resources, or sharing threat intelligence. Education efforts now include training for secure coding practices in open-source environments. Conferences like 'All Contributors Welcome' spotlight maintainers from the Global South and LGBTQ+ coders. These efforts aim to build a cybersecurity landscape that’s not only robust but truly representative of the global community it serves.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Digital Identity and the Fight for Privacy",
                intro: "As digital IDs expand, so do questions about control, bias, and security.",
                chapeau: "Governments and companies are rolling out digital identity systems, but how do we ensure they are secure and fair?",
                tag: tagModel.cybersecurity,
                datePublication: "19 juillet 2025",
                imageCouv: "cyber-7",
                contentArticle: [
                    .subtitle1("Global Momentum"),
                    .paragraph1("From India’s Aadhaar to the EU’s eID, digital identity programs are scaling fast. They promise convenience, access to services, and fraud prevention. But critics warn of centralized data risks, potential surveillance, and discrimination if systems are poorly designed. Biometric data, often immutable, is now a common identifier, yet storage practices vary widely. Cybersecurity experts are calling for robust encryption, transparent policies, and citizen oversight. In Africa and Latin America, localized efforts are combining mobile-first approaches with open standards. The aim: give individuals control over their identity data. And technologists are pushing for 'self-sovereign identity'—a model where users own and share credentials on their terms."),
                    .image("cyber-8"),
                    .subtitle1("Designing for Equity"),
                    .paragraph2("A key concern is who gets excluded when systems go digital. Accessibility, literacy, and internet access vary across populations. That’s why designers are rethinking interfaces and fallback mechanisms. Ethical design in digital identity means involving users from different backgrounds in the design and testing phases. Open audits, bug bounties, and global consultations are slowly becoming best practices. Privacy doesn’t have to be sacrificed for convenience—but it requires vigilance, innovation, and inclusive governance. The future of digital identity must be secure, yes—but also equitable.")
                ],
                isBig: true,
                isOnSlider: false
            ),
            Article(
                titre: "Cybersecurity Startups to Watch in 2025",
                intro: "A new wave of startups is reshaping the cybersecurity landscape.",
                chapeau: "These innovators are building tools that are faster, smarter, and more inclusive.",
                tag: tagModel.cybersecurity,
                datePublication: "18 juillet 2025",
                imageCouv: "cyber-9",
                contentArticle: [
                    .subtitle1("Rethinking the Stack"),
                    .paragraph1("From AI-driven threat detection to decentralized firewalls, startups are introducing radical changes to how we think about security architecture. Some are tackling gaps in existing platforms—like adding multilingual phishing detection or creating mobile-friendly dashboards for incident response. Others are innovating with gamification, helping companies train employees through immersive, scenario-based learning. Notably, many of these startups are founded by people from historically underrepresented backgrounds. Incubators are increasingly prioritizing diversity not just in teams, but also in the problems they tackle. Funding agencies now ask about inclusivity in product design as part of due diligence. It’s a shift toward cybersecurity that reflects the real world."),
                    .image("cyber-10"),
                    .subtitle1("Impact and Growth"),
                    .paragraph2("Several of these startups are gaining traction in government and education sectors. Their solutions are seen as both cost-effective and community-aware. They partner with NGOs, local ISPs, and municipalities to bring security tools to places traditionally ignored by the industry. Open-source alternatives are emerging to replace bloated legacy systems. As one founder put it, 'We’re not just securing data—we’re securing dignity.' The inclusive, pragmatic ethos of this new wave might be exactly what cybersecurity needs to meet tomorrow’s challenges.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Breaking Barriers in Cyber Security",
                intro: "Highlighting the women and marginalized voices changing the face of cybersecurity.",
                chapeau: "The cybersecurity field has long been dominated by certain demographics. But change is underway—and it’s redefining how we protect the digital world.",
                tag: tagModel.cybersecurity,
                datePublication: "17 juillet 2025",
                imageCouv: "cyber-11",
                contentArticle: [
                    .subtitle1("New Faces, New Strengths"),
                    .paragraph1("More women, non-binary individuals, and people of color are entering the cybersecurity field, not just as analysts but as leaders, researchers, and founders. Organizations like Women in Cybersecurity (WiCyS), BlackCyberSec, and LatinxSec are helping build inclusive pipelines through scholarships, mentorship, and conferences. Representation matters—not just for equity but because diverse teams often outperform homogeneous ones in identifying threats and building resilient systems."),
                    .image("cyber-12"),
                    .subtitle1("From Tokenism to Leadership"),
                    .paragraph2("Despite progress, many newcomers still face barriers: bias in hiring, lack of support, and limited visibility. That’s changing thanks to advocacy, data transparency, and community-led efforts. Tech events now prioritize speaker diversity, and funding for inclusive cybersecurity startups is growing. Curriculum reform in universities is also helping by featuring case studies from a range of global contexts. True inclusion means more than hiring quotas—it’s about shifting culture and power. The future of cybersecurity isn’t just safer—it’s more just.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            
               // WEB / MOBILE
            Article(
                titre: "Designing with Fingers, Not Just Eyes",
                intro: "Why mobile-first means touch-first, too.",
                chapeau: "On mobile, the thumb rules everything. UI patterns must evolve to match how users really interact with their phones—fast, one-handed, and often on the go.",
                tag: tagModel.web,
                datePublication: "25 juillet 2025",
                imageCouv: "web-1",
                contentArticle: [
                    .subtitle1("Thumb Zones Matter"),
                    .paragraph1("Designers now map screens based on 'thumb reach', especially on larger devices. Key actions belong in the natural sweep of the dominant hand—not hidden at the top. Floating buttons, swipe gestures, and bottom navigation bars are no longer just trends; they’re usability essentials."),
                    .image("web-2"),
                    .subtitle1("Beyond Aesthetics"),
                    .paragraph2("Touch-friendly design is about function, not just form. Small targets, nested menus, and accidental taps break flow. Tools like heatmaps and tap tests reveal what real users struggle with. A mobile UI that anticipates motion—and mistakes—creates smoother, more intuitive experiences.")
                ],
                isBig: false,
                isOnSlider: false
            ),

            Article(
                titre: "Offline UX Still Matters",
                intro: "Users lose signal. Apps shouldn’t lose function.",
                chapeau: "Connectivity is inconsistent—even in 2025. Building apps that work offline or with limited signal isn't a niche concern: it’s a baseline for global usability.",
                tag: tagModel.web,
                datePublication: "24 juillet 2025",
                imageCouv: "web-3",
                contentArticle: [
                    .subtitle1("Plan for Disconnection"),
                    .paragraph1("From trains to rural zones, users often get cut off. Progressive Web Apps (PWAs), local storage, and service workers allow apps to stay responsive and useful, even offline. Messaging apps like WhatsApp and productivity tools like Notion now sync changes once back online—a model more developers are adopting."),
                    .image("web-4"),
                    .subtitle1("Graceful Degradation Isn’t Dead"),
                    .paragraph2("Instead of blank screens or errors, apps should communicate clearly: show what’s cached, what’s pending, and when updates occur. Smart UX anticipates network gaps and builds trust through transparency. Going offline isn’t a failure—it’s a test of thoughtful design.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            
            Article(
                titre: "Why Your App Should Load in One Second",
                intro: "Speed is accessibility—and retention.",
                chapeau: "Users abandon apps that lag. Performance isn’t just a technical metric—it’s a core part of user experience and equity. Seconds matter, everywhere.",
                tag: tagModel.web,
                datePublication: "23 juillet 2025",
                imageCouv: "web-5",
                contentArticle: [
                    .subtitle1("Every Millisecond Counts"),
                    .paragraph1("On mobile, load time is everything. Research shows bounce rates spike after just two seconds. Lightweight assets, optimized images, and native transitions help keep experiences fluid. Tools like Lighthouse and WebPageTest expose the friction points users feel—but don’t always report."),
                    .image("web-6"),
                    .subtitle1("Fast ≠ Fancy"),
                    .paragraph2("Speed doesn’t require flash. In fact, over-animated pages often hurt more than help. Prioritizing performance means choosing minimalism, lazy loading, and critical-path rendering. Teams that bake performance into their sprints build apps that not only feel better—but work better under pressure.")
                ],
                isBig: false,
                isOnSlider: true            ),
            Article(
                titre: "Inclusive Design Is Mobile Design",
                intro: "Small screens demand big accessibility thinking.",
                chapeau: "Accessibility is often treated as a desktop issue. But mobile users—especially those with disabilities—face unique challenges that require adaptive, responsive, and inclusive approaches.",
                tag: tagModel.web,
                datePublication: "22 juillet 2025",
                imageCouv: "web-7",
                contentArticle: [
                    .subtitle1("Zoom Isn’t a Fix"),
                    .paragraph1("Users who rely on screen readers or larger font settings often find broken layouts, cut-off buttons, or hidden menus. Responsive design must account for these variations, not just device sizes. Semantic HTML, ARIA roles, and scalable typography are key—even on native apps."),
                    .image("web-8"),
                    .subtitle1("Test with Real Users"),
                    .paragraph2("Automated checks only go so far. True accessibility on mobile comes from testing with people who use assistive tech daily. VoiceOver, TalkBack, high-contrast settings—all shape how users experience your app. The best interfaces aren’t just functional—they’re welcoming.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "From Dark Mode to Dark Patterns",
                intro: "Design isn’t neutral. It nudges behavior.",
                chapeau: "Modern mobile UX often walks a fine line between helpful and manipulative. As apps fight for engagement, ethical design has never been more urgent.",
                tag: tagModel.web,
                datePublication: "21 juillet 2025",
                imageCouv: "web-9",
                contentArticle: [
                    .subtitle1("Patterns That Push"),
                    .paragraph1("Infinite scroll, hard-to-cancel subscriptions, or misleading CTAs—these are more than annoyances. They’re known as dark patterns, and they erode user trust. Designers are now reevaluating how UX choices influence emotion and attention, especially on always-on mobile platforms."),
                    .image("web-10"),
                    .subtitle1("Trust as a Feature"),
                    .paragraph2("Some apps now list 'ethical UX' in their product principles. That means transparency, friction-free opt-outs, and clear data usage. Users are demanding it—and regulators are watching. When design respects agency, everyone wins.")
                ],
                isBig: true,
                isOnSlider: false
            ),
            Article(
                titre: "Why Notifications Need a Rethink",
                intro: "Ping fatigue is real—and harmful.",
                chapeau: "Notifications are supposed to be helpful. But too often, they disrupt, distract, and disengage. Thoughtful notification design is becoming a priority for modern mobile teams.",
                tag: tagModel.web,
                datePublication: "20 juillet 2025",
                imageCouv: "web-11",
                contentArticle: [
                    .subtitle1("More Signal, Less Noise"),
                    .paragraph1("Default notifications often treat all events as equally urgent. The result? Users turn everything off—or worse, uninstall the app. Smart mobile design now means grouping alerts, offering digest summaries, and giving users full control over what they receive and when."),
                    .image("web-12"),
                    .subtitle1("Respecting Focus"),
                    .paragraph2("With growing awareness of digital wellbeing, platforms like iOS and Android now support focus modes and notification filters. Designers must align with these features—not fight them. The best apps notify with purpose, not pressure.")
                ],
                isBig: false,
                isOnSlider: false
            ),

               // UX / UI
            Article(
                titre: "The Power of Microinteractions",
                intro: "Small moments shape big user experiences.",
                chapeau: "From a button ripple to a success checkmark, microinteractions guide users, build feedback loops, and give apps personality. When done well, they go unnoticed—yet feel essential.",
                tag: tagModel.uxui,
                datePublication: "25 juillet 2025",
                imageCouv: "ux-1",
                contentArticle: [
                    .subtitle1("Clarity in Motion"),
                    .paragraph1("Microinteractions help users understand cause and effect. Think: a heart icon that pulses when tapped, or a subtle shake on invalid input. These tiny cues provide feedback without words, reducing confusion and making the interface feel alive."),
                    .image("ux-2"),
                    .subtitle1("Delight Without Distraction"),
                    .paragraph2("Good microinteractions support flow—bad ones break it. They should be fast, purposeful, and consistent. Designers often prototype these using tools like Figma or Lottie, ensuring that the motion feels natural. In UX, it’s the smallest details that build the deepest trust.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "UX Writing Is Design",
                intro: "Words guide just as much as visuals.",
                chapeau: "Interfaces are full of text—buttons, alerts, labels. UX writing isn’t about cleverness, it’s about clarity. Good copy turns navigation into intuition.",
                tag: tagModel.uxui,
                datePublication: "24 juillet 2025",
                imageCouv: "ux-3",
                contentArticle: [
                    .subtitle1("Designing with Language"),
                    .paragraph1("A confusing CTA or vague error message can break the experience. UX writers collaborate with designers to make sure words match user expectations. 'Try again' isn’t the same as 'Something went wrong'—language sets tone and trust."),
                    .image("ux-4"),
                    .subtitle1("Tone = Experience"),
                    .paragraph2("Brand voice should adapt across contexts: supportive in errors, clear in instructions, brief in actions. Great UX writing reduces cognitive load and creates consistency. When design and language align, the interface feels seamless.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Why UI Needs Real Data Early",
                intro: "Mock content isn’t user content.",
                chapeau: "Using real content from the start reveals design flaws faster. Placeholder text hides layout issues, confusion points, and edge cases that only show up with true data.",
                tag: tagModel.uxui,
                datePublication: "23 juillet 2025",
                imageCouv: "ux-5",
                contentArticle: [
                    .subtitle1("Designing Beyond Lorem Ipsum"),
                    .paragraph1("Real names, real errors, real stats—these expose how a UI behaves under pressure. Will a username overflow? Will a metric make sense in context? Testing designs with real or realistic content builds resilience early."),
                    .image("ux-6"),
                    .subtitle1("From Prototype to Product"),
                    .paragraph2("Design tools like Figma and Framer now allow data injection—pulling from APIs, spreadsheets or JSON files. This helps simulate live use without full backend integration. When UIs meet real content, they meet real challenges.")
                ],
                isBig: true,
                isOnSlider: false
            ),
            Article(
                titre: "Dark Mode Is More Than Aesthetic",
                intro: "Comfort, clarity, and battery life—by design.",
                chapeau: "Dark mode isn't just a style trend. It’s a functional choice that reduces eye strain, improves contrast, and respects user environments—especially on mobile and OLED screens.",
                tag: tagModel.uxui,
                datePublication: "22 juillet 2025",
                imageCouv: "ux-7",
                contentArticle: [
                    .subtitle1("Designing for Two Modes"),
                    .paragraph1("Supporting dark mode means planning for contrast, readability, and emotion in both light and dark themes. It affects illustration colors, brand identity, and even the tone of the UI. Tools now let designers preview both modes side by side."),
                    .image("ux-8"),
                    .subtitle1("Respecting User Preference"),
                    .paragraph2("Most platforms now support system-level dark mode toggles. Ignoring them frustrates users. A good UX respects device settings, ensures accessibility in both states, and avoids hard-coded brightness. It’s not about 'looking cool'—it’s about adapting to context.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "When Animation Enhances UX",
                intro: "Motion can guide—not distract.",
                chapeau: "Used intentionally, animation can highlight changes, provide context, and soften transitions. The goal isn’t to entertain, but to orient and reassure.",
                tag: tagModel.uxui,
                datePublication: "21 juillet 2025",
                imageCouv: "ux-9",
                contentArticle: [
                    .subtitle1("Designing Transitions That Teach"),
                    .paragraph1("When a new screen slides in or a card flips, users get visual cues about hierarchy and direction. Without animation, UIs feel abrupt. Motion helps users track changes and maintain their mental map of the interface."),
                    .image("ux-10"),
                    .subtitle1("Subtle, Purposeful, Consistent"),
                    .paragraph2("Animations should be short, smooth, and meaningful. Avoid bouncy or excessive effects that steal attention. Design systems like Material and Fluent now define motion patterns for clarity. Good animation is felt, not noticed.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Design Systems Save Time—and Sanity",
                intro: "Consistency is efficiency.",
                chapeau: "Design systems bring order to growing teams. They align developers and designers with shared components, patterns, and guidelines—reducing rework and boosting scalability.",
                tag: tagModel.uxui,
                datePublication: "20 juillet 2025",
                imageCouv: "ux-11",
                contentArticle: [
                    .subtitle1("Build Once, Reuse Often"),
                    .paragraph1("Buttons, modals, inputs—all repeat across products. A design system defines these once and lets teams reuse them with consistency. Figma libraries and component tokens let designers work faster and ensure cohesion across screens."),
                    .image("ux-12"),
                    .subtitle1("Bridge Between Design and Code"),
                    .paragraph2("Design systems aren’t just visual—they include code, documentation, and usage rules. Tools like Storybook and Zeroheight help teams maintain living systems. The result? Fewer bugs, better collaboration, and faster delivery.")
                ],
                isBig: false,
                isOnSlider: true
            ),
               // DATA SCIENCE
            Article(
                titre: "Making Data Human Again",
                intro: "Empathy is a data skill.",
                chapeau: "Spreadsheets don’t change the world—stories do. Translating insights into meaning is becoming the most valuable part of the data pipeline.",
                tag: tagModel.dataScience,
                datePublication: "25 juillet 2025",
                imageCouv: "data-1",
                contentArticle: [
                    .subtitle1("From Dashboards to Decisions"),
                    .paragraph1("Companies are buried in dashboards that no one reads. Analysts who tell stories—who connect trends to real-world impact—are the ones creating change. Good data science doesn’t just answer what, but why it matters."),
                    .image("data-2"),
                    .subtitle1("Visual First, Then Verbal"),
                    .paragraph2("A great chart does more than look pretty—it clarifies. Tools like Datawrapper, Flourish, and Observable let scientists turn complexity into intuition. But design without empathy fails. The best communicators shape how people feel, not just what they know.")
                ],
                isBig: false,
                isOnSlider: false
              ),
            Article(
                titre: "Bias Isn’t Just in the Data",
                intro: "Assumptions shape algorithms.",
                chapeau: "From hiring tools to health models, machine learning systems inherit the worldviews of their makers. Data scientists are learning to audit not just inputs—but intent.",
                tag: tagModel.dataScience,
                datePublication: "24 juillet 2025",
                imageCouv: "data-3",
                contentArticle: [
                    .subtitle1("Training Data, Trained Thinking"),
                    .paragraph1("Bias often enters before the first dataset. It begins with the questions we ask, the labels we choose, and the proxies we allow. Is ZIP code a stand-in for race? Are we prioritizing historical trends over ethical ones?"),
                    .image("data-4"),
                    .subtitle1("The Rise of Responsible AI"),
                    .paragraph2("More teams are adopting practices like model cards, data documentation, and fairness tests. Open-source libraries such as `Aequitas` and `Fairlearn` help detect and mitigate bias. But tooling isn’t enough—diverse teams and ethical review boards are essential to change culture.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Not Every Problem Needs a Model",
                intro: "Simplicity scales better.",
                chapeau: "In the rush to use AI, many teams forget that a spreadsheet and some logic often outperform overengineered models. Data science should serve the problem—not the hype.",
                tag: tagModel.dataScience,
                datePublication: "23 juillet 2025",
                imageCouv: "data-5",
                contentArticle: [
                    .subtitle1("Start With Questions, Not Tools"),
                    .paragraph1("Predicting churn? You might not need XGBoost. A decision tree and clear segmentation can often do the job faster and more transparently. Simple solutions are easier to explain, maintain, and trust."),
                    .image("data-6"),
                    .subtitle1("Complex ≠ Valuable"),
                    .paragraph2("Stakeholders care about impact, not accuracy to the 4th decimal. Time spent fine-tuning hyperparameters might be better spent on better data cleaning or user feedback. The best data scientists don’t flex—they focus.")
                ],
                isBig: true,
                isOnSlider: false
            ),
            Article(
                titre: "The Data Engineer's Comeback",
                intro: "Pipelines are product features.",
                chapeau: "Once seen as backend-only, data engineering is now central to fast, reliable products. Without clean, scalable pipelines—AI and analytics simply don’t work.",
                tag: tagModel.dataScience,
                datePublication: "22 juillet 2025",
                imageCouv: "data-7",
                contentArticle: [
                    .subtitle1("From SQL to Spark to Stream"),
                    .paragraph1("Modern engineers juggle batch and real-time processing, cloud orchestration, and versioned datasets. Whether using dbt, Airflow, or Kafka, the role has evolved into one that demands product sense and system thinking."),
                    .image("data-8"),
                    .subtitle1("Fix the Foundation First"),
                    .paragraph2("Great models rely on great inputs. Engineers now focus on observability—monitoring freshness, schema drift, and latency. Because in 2025, dirty data breaks more than reports—it breaks customer trust.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Everyone's a Data Scientist Now",
                intro: "Or at least they should be.",
                chapeau: "The best data teams aren’t gatekeepers. They empower others. Through self-serve dashboards, lightweight tools, and collaborative culture, data becomes part of everyone’s job.",
                tag: tagModel.dataScience,
                datePublication: "21 juillet 2025",
                imageCouv: "data-9",
                contentArticle: [
                    .subtitle1("Democratizing Insight"),
                    .paragraph1("Platforms like Looker, Metabase, and Hex let non-technical users explore data safely. With good documentation and guardrails, even marketers or PMs can answer their own questions—freeing up scientists for deeper work."),
                    .image("data-10"),
                    .subtitle1("Culture Eats Stack for Breakfast"),
                    .paragraph2("It’s not just about tools. Teams that share assumptions, speak a common data language, and treat questions with curiosity—not judgement—build better products. In a healthy org, data isn’t siloed. It’s shared.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Data Privacy in the Age of AI",
                intro: "Prediction meets protection.",
                chapeau: "As machine learning gets more powerful, user data becomes more vulnerable. Data scientists must now act as privacy advocates—baking ethics into their pipelines from the start.",
                tag: tagModel.dataScience,
                datePublication: "20 juillet 2025",
                imageCouv: "data-11",
                contentArticle: [
                    .subtitle1("More Than Anonymity"),
                    .paragraph1("Simply masking names or emails isn’t enough. Re-identification attacks can still work. That’s why methods like differential privacy and synthetic data are gaining ground—protecting identities while preserving patterns."),
                    .image("data-12"),
                    .subtitle1("Transparency Builds Trust"),
                    .paragraph2("Privacy policies aren’t just legal checkboxes—they’re UX. Explain what’s collected, why, and how users can opt out. Tools like DataHaven and privacy dashboards let teams build trust by default.")
                ],
                isBig: false,
                isOnSlider: false
            ),

               // ARTIFICIAL INTELLIGENCE
            Article(
                titre: "The Prompt Is the Product",
                intro: "Language shapes machine behavior.",
                chapeau: "Prompt engineering is redefining how we interact with AI. Knowing what to ask—and how—is becoming a critical design and development skill.",
                tag: tagModel.ai,
                datePublication: "25 juillet 2025",
                imageCouv: "ia-1",
                contentArticle: [
                    .subtitle1("Designing the Input Layer"),
                    .paragraph1("With large language models, the quality of the prompt often determines the usefulness of the output. Teams now craft prompts like UX flows—testing variations, adding context, and embedding instructions to guide behavior."),
                    .image("ia-2"),
                    .subtitle1("Tools for Prompt Mastery"),
                    .paragraph2("Platforms like PromptLayer and LangChain help teams manage, version, and debug prompts. Prompt writing is no longer trial and error—it’s becoming a structured, repeatable discipline.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "AI Models Don’t Understand—Yet",
                intro: "They mimic, not think.",
                chapeau: "Despite astonishing fluency, generative AI doesn’t reason like humans. Recognizing its limits is key to using it responsibly.",
                tag: tagModel.ai,
                datePublication: "24 juillet 2025",
                imageCouv: "ia-3",
                contentArticle: [
                    .subtitle1("Prediction ≠ Cognition"),
                    .paragraph1("LLMs like GPT and Claude don’t 'know' in a human sense. They predict what words are likely to follow, based on vast data. That makes them powerful—but also unreliable. Hallucinations and false confidence remain major risks."),
                    .image("ia-4"),
                    .subtitle1("Use With Supervision"),
                    .paragraph2("AI tools shine when paired with human oversight. In writing, coding, and research, they can speed up drafts or surface ideas—but critical thinking stays human. Knowing when to trust and when to check is essential.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Smaller Models, Bigger Impact",
                intro: "Local AI is on the rise.",
                chapeau: "Big isn't always better. Edge-friendly AI models are enabling fast, private, and offline experiences—from on-device assistants to smart cameras.",
                tag: tagModel.ai,
                datePublication: "23 juillet 2025",
                imageCouv: "ia-5",
                contentArticle: [
                    .subtitle1("Why Go Small?"),
                    .paragraph1("Smaller models like Mistral, Phi, or LLaMa can run on laptops or phones. This makes AI accessible even in bandwidth-constrained settings, while protecting user data from cloud dependency."),
                    .image("ia-6"),
                    .subtitle1("Performance Meets Privacy"),
                    .paragraph2("Tools like Ollama and GGML help developers deploy compact models efficiently. As regulation tightens, local AI is emerging not just as a technical choice—but a strategic one.")
                ],
                isBig: true,
                isOnSlider: false
            ),
            Article(
                titre: "AI Needs Better UX",
                intro: "Interfaces are lagging behind models.",
                chapeau: "Large models are powerful—but using them often feels clunky. Designers now face the challenge of building AI-native interfaces that guide, explain, and build trust.",
                tag: tagModel.ai,
                datePublication: "22 juillet 2025",
                imageCouv: "ia-7",
                contentArticle: [
                    .subtitle1("From Chatbots to Copilots"),
                    .paragraph1("Chat isn’t the only UX pattern. Designers are exploring guided workflows, command palettes, and inline suggestions that feel smoother and more integrated than a text box."),
                    .image("ia-8"),
                    .subtitle1("Explainability Is Part of UX"),
                    .paragraph2("Users want to know what AI is doing—and why. Good design includes transparency: tooltips, citations, model disclosures, and controls to tweak or refine output.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "The Ethics Layer Is Missing",
                intro: "AI moves faster than governance.",
                chapeau: "From bias to misinformation, AI systems raise urgent ethical questions. But most teams still lack processes, people, and tools to address them meaningfully.",
                tag: tagModel.ai,
                datePublication: "21 juillet 2025",
                imageCouv: "ia-9",
                contentArticle: [
                    .subtitle1("Risks by Default"),
                    .paragraph1("Models trained on web-scale data inherit its flaws—stereotypes, toxicity, and bias. Without proper filtering, red-teaming, or oversight, those risks scale with the product."),
                    .image("ia-10"),
                    .subtitle1("Toward Responsible Deployment"),
                    .paragraph2("Ethics reviews, model documentation, and impact assessments should be part of the release cycle. But they’re not yet standard. Advocacy is growing, and tools like Hugging Face’s ‘Model Cards’ help—but culture change is slow.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "When AI Augments, Not Replaces",
                intro: "Co-creation beats automation.",
                chapeau: "The best use cases of AI aren’t about removing humans—they’re about enhancing them. From code generation to visual ideation, the magic happens in collaboration.",
                tag: tagModel.ai,
                datePublication: "20 juillet 2025",
                imageCouv: "ia-11",
                contentArticle: [
                    .subtitle1("Humans in the Loop"),
                    .paragraph1("Figma plugins suggest layouts. GitHub Copilot writes boilerplate. Canva generates templates. In all these tools, AI supports creativity—but doesn’t dictate it. Users stay in control."),
                    .image("ia-12"),
                    .subtitle1("Friction Is Productive"),
                    .paragraph2("Designing AI that invites feedback, not passivity, makes users feel empowered. Interfaces that ask for confirmation, allow edits, or offer alternatives keep humans at the center of the process.")
                ],
                isBig: false,
                isOnSlider: true
            ),

               // DEVOPS
            Article(
                titre: "From CI to AI",
                intro: "Automation is moving up the stack.",
                chapeau: "DevOps began with build pipelines. Now, machine learning helps predict failures, optimize deployments, and detect anomalies before they hit production.",
                tag: tagModel.devops,
                datePublication: "25 juillet 2025",
                imageCouv: "devops-1",
                contentArticle: [
                    .subtitle1("Smarter Pipelines"),
                    .paragraph1("ML-enhanced CI/CD platforms analyze past build failures and suggest fixes. They can prioritize flaky tests, recommend rollbacks, or auto-approve safe changes."),
                    .image("devops-2"),
                    .subtitle1("AIOps in Practice"),
                    .paragraph2("Teams use AIOps to monitor logs, detect patterns, and reduce noise in alerts. This helps Ops focus on real incidents—not false positives.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Infrastructure as Code Is Culture",
                intro: "Terraforming teams, not just systems.",
                chapeau: "IaC tools like Terraform and Pulumi changed how infra is provisioned. But the real transformation is how they shape team habits, reviews, and collaboration.",
                tag: tagModel.devops,
                datePublication: "24 juillet 2025",
                imageCouv: "devops-3",
                contentArticle: [
                    .subtitle1("GitOps Mentality"),
                    .paragraph1("Infra changes now go through PRs. That means more peer review, clearer history, and better rollback practices. Infra isn’t tribal knowledge anymore—it’s shared and versioned."),
                    .image("devops-4"),
                    .subtitle1("Onboarding and Guardrails"),
                    .paragraph2("With IaC modules and reusable patterns, new hires can ship safely on day one. Teams bake in security, budget limits, and naming standards as code.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Dev Environments in Seconds",
                intro: "Local setup is becoming obsolete.",
                chapeau: "Cloud dev environments like Codespaces, Gitpod, or Coder let developers spin up fully-configured workspaces instantly—no more ‘it works on my machine’.",
                tag: tagModel.devops,
                datePublication: "23 juillet 2025",
                imageCouv: "devops-5",
                contentArticle: [
                    .subtitle1("Portable and Predictable"),
                    .paragraph1("Cloud IDEs eliminate hours of onboarding and debug time. They ensure devs work with the same tools, dependencies, and secrets as CI."),
                    .image("devops-6"),
                    .subtitle1("Security and Speed"),
                    .paragraph2("No more storing secrets locally. Workspaces expire automatically. Teams iterate faster and stay safer.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "DevOps Needs UX Too",
                intro: "Dashboards aren’t enough.",
                chapeau: "Developer platforms often prioritize power over usability. But good internal tools should be discoverable, safe, and even pleasant to use.",
                tag: tagModel.devops,
                datePublication: "22 juillet 2025",
                imageCouv: "devops-7",
                contentArticle: [
                    .subtitle1("Developer Experience Matters"),
                    .paragraph1("Self-service infra, feature toggles, and deploy pipelines should have intuitive interfaces—not just YAML. Good DX reduces errors and support tickets."),
                    .image("devops-8"),
                    .subtitle1("Observability ≠ Overload"),
                    .paragraph2("Alert fatigue is real. Teams are simplifying logs, tracing flows, and grouping alerts meaningfully. Good design improves incident response.")
                ],
                isBig: true,
                isOnSlider: false
            ),
            Article(
                titre: "Platform Engineering Is the New SRE",
                intro: "Enabling developers at scale.",
                chapeau: "Rather than every team reinventing infra, platform engineers build paved paths—secure, supported ways to deploy, monitor, and scale software.",
                tag: tagModel.devops,
                datePublication: "21 juillet 2025",
                imageCouv: "devops-9",
                contentArticle: [
                    .subtitle1("Golden Paths, Not Silver Bullets"),
                    .paragraph1("Standardized templates, reusable modules, and internal docs help developers stay productive while avoiding pitfalls."),
                    .image("devops-10"),
                    .subtitle1("SRE Evolves"),
                    .paragraph2("The SRE mindset—resilience, automation, observability—is now applied to internal platforms. The goal: reduce toil, empower teams.")
                ],
                isBig: false,
                isOnSlider: false
            ),
            Article(
                titre: "Shipping Faster, Breaking Less",
                intro: "Speed and safety go hand in hand.",
                chapeau: "Modern DevOps isn’t just about velocity—it’s about safe delivery. Canary deploys, feature flags, and rollback automation are now must-haves.",
                tag: tagModel.devops,
                datePublication: "20 juillet 2025",
                imageCouv: "devops-11",
                contentArticle: [
                    .subtitle1("Progressive Delivery"),
                    .paragraph1("Why ship to everyone at once? Teams now roll out to 5%, monitor health, and expand only if metrics hold. This limits blast radius and boosts confidence."),
                    .image("devops-12"),
                    .subtitle1("Flags Over Branches"),
                    .paragraph2("Feature flags let teams decouple deploy from release. That means less stress, faster tests, and smoother launches.")
                ],
                isBig: false,
                isOnSlider: false
            ),
        ]
    }
    func FilteredArticles(currentArticle: Article) -> [Article] {
        return articlesArray.filter {$0.tag == currentArticle.tag && $0.id != currentArticle.id}.shuffled()  // shuffled() = Mélange aléatoirement les articles proposés
    }
}
