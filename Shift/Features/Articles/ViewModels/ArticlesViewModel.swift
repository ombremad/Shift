//
// .swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

@Observable
class ArticlesViewModel {
    
    let tagModel: fieldOfInterestModel //Objet qui contient toutes les instances des tag pour acceder à tous
    var articlesArray: [Article]
    
    init() {
        self.tagModel = fieldOfInterestModel()
        
        self.articlesArray = [
            Article(
                   titre: "Breaking Barriers in Cyber Security",
                   intro: "Meet Lina, a leader in cyber defense strategies.",
                   chapeau: "Lina's story is one of resilience, growth, and hacking gender norms. She paved her way into cybersecurity despite the odds and mentors others to do the same.",
                   tag: tagModel.cybersecurity,
                   datePublication: "17 juillet 2025",
                   imageCouv: "cyber-1",
                   contentArticle: [
                       .subtitle1("Early Challenges"),
                       .paragraph1("Lina’s journey into cybersecurity began when she discovered a flaw in a school network. She taught herself Linux and scripting and now leads secure infrastructure projects."),
                       .image("cyber-2"),
                       .subtitle1("Shaping Policy"),
                       .paragraph2("Lina mentors young women in tech and advises organizations on cyber resilience. Her work is shaping national standards."),
                   ],
                   isNew : false,
                   isBig: false
               ),
               Article(
                   titre: "How Zoé Builds Safer Networks",
                   intro: "Zoé is on a mission to protect digital environments from threats.",
                   chapeau: "Her passion for network security started in college. Since then, she’s been leading penetration tests and advising banks on best practices.",
                   tag: tagModel.cybersecurity,
                   datePublication: "5 juillet 2025",
                   imageCouv: "cyber-3",
                   contentArticle: [
                       .subtitle1("A New Path"),
                       .paragraph1("Zoé shifted from IT support to cybersecurity after attending a workshop. Her skills in scripting and forensics helped her grow rapidly."),
                       .image("cyber-4"),
                       .subtitle1("Going Pro"),
                       .paragraph2("Now a penetration tester, she ensures companies follow the latest protocols and offers workshops for non-tech employees.")
                   ],
                   isNew : false,
                   isBig: false
               ),
               Article(
                   titre: "Cybersecurity for All: Jamila's Vision",
                   intro: "Jamila works at the intersection of education and cyber defense.",
                   chapeau: "Jamila believes everyone should understand digital safety. Through public outreach and education, she demystifies cybersecurity for all.",
                   tag: tagModel.cybersecurity,
                   datePublication: "10 juillet 2025",
                   imageCouv: "cyber-5",
                   contentArticle: [
                       .subtitle1("Education First"),
                       .paragraph1("Jamila designs workshops for teens and seniors, teaching secure habits, password safety, and phishing awareness."),
                       .image("cyber-6"),
                       .subtitle1("Wider Impact"),
                       .paragraph2("She’s working with public libraries to create cybersecurity learning spaces accessible to everyone.")
                   ],
                   isNew : false,
                   isBig: false
               ),

               // WEB / MOBILE
               Article(
                   titre: "Sophie Builds for the Web",
                   intro: "Discover how Sophie creates accessible web platforms.",
                   chapeau: "Sophie believes good design starts with inclusivity. From mobile-first design to responsive interfaces, she brings empathy to tech.",
                   tag: tagModel.web,
                   datePublication: "8 juillet 2025",
                   imageCouv: "webMobile-1",
                   contentArticle: [
                       .subtitle1("Her Beginnings"),
                       .paragraph1("A former graphic designer, Sophie learned front-end development to bridge design and functionality."),
                       .image("webMobile-2"),
                       .subtitle1("Modern Web"),
                       .paragraph2("She contributes to open-source projects focused on accessibility and responsive components.")
                   ],
                   isNew : true,
                   isBig: true
               ),
               Article(
                   titre: "Fatima and the Future of Mobile",
                   intro: "Fatima is rethinking how we use mobile devices.",
                   chapeau: "Fatima focuses on offline-first apps and edge computing. Her projects empower users in low-connectivity zones.",
                   tag: tagModel.web,
                   datePublication: "6 juillet 2025",
                   imageCouv: "webMobile-3",
                   contentArticle: [
                       .subtitle1("Offline Innovation"),
                       .paragraph1("Fatima's latest app caches data intelligently to support users with unstable connections."),
                       .image("webMobile-4"),
                       .subtitle1("Impact at Scale"),
                       .paragraph2("She consults NGOs to build mobile platforms for remote areas, with a strong UX focus.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "Leila Masters Progressive Web Apps",
                   intro: "Leila is making PWAs more powerful.",
                   chapeau: "By blending native app experiences with web technologies, Leila is expanding what’s possible on the browser.",
                   tag: tagModel.web,
                   datePublication: "4 juillet 2025",
                   imageCouv: "webMobile-5",
                   contentArticle: [
                       .subtitle1("Push and Performance"),
                       .paragraph1("She implemented service workers and caching to support instant page loads."),
                       .image("webMobile-6"),
                       .subtitle1("Beyond Browsers"),
                       .paragraph2("Leila shares her knowledge in meetups, helping junior devs understand PWA potential.")
                   ],
                   isNew : true,
                   isBig: false
               ),

               // UX / UI
               Article(
                   titre: "Designing a Better Future with Amina",
                   intro: "Meet Amina, UX designer changing lives through empathy.",
                   chapeau: "Amina blends research, creativity, and accessibility to make interfaces that truly serve users. Her latest project helps the visually impaired navigate public transit.",
                   tag: tagModel.uxui,
                   datePublication: "2 juillet 2025",
                   imageCouv: "ux-1",
                   contentArticle: [
                       .subtitle1("First Steps"),
                       .paragraph1("Amina began as an illustrator, then moved into UX after volunteering for a civic tech project."),
                       .image("ux-2"),
                       .subtitle1("Making an Impact"),
                       .paragraph2("She now leads user research initiatives and mentors design students worldwide.")
                   ],
                   isNew : true,
                   isBig: false
               ),
            
               Article(
                   titre: "Nadia Reinvents UI for Wearables",
                   intro: "Nadia crafts interfaces for devices on the move.",
                   chapeau: "Her design philosophy focuses on minimalism and clarity. From watches to smart glasses, she’s creating intuitive UIs.",
                   tag: tagModel.uxui,
                   datePublication: "1 juillet 2025",
                   imageCouv: "ux-3",
                   contentArticle: [
                       .subtitle1("Challenges in Motion"),
                       .paragraph1("Designing for small screens required Nadia to rethink gestures, contrast, and information hierarchy."),
                       .image("ux-4"),
                       .subtitle1("User First"),
                       .paragraph2("She advocates for ethical design, ensuring privacy is respected at the interface level.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "UX That Moves with You: Farah’s Journey",
                   intro: "Farah makes experiences smoother through user-centered design.",
                   chapeau: "Farah’s journey from architecture to UX gives her a unique view of space and flow. Her approach focuses on movement, ease, and accessibility.",
                   tag: tagModel.uxui,
                   datePublication: "29 juin 2025",
                   imageCouv: "ux-5",
                   contentArticle: [
                       .subtitle1("Structure Meets Empathy"),
                       .paragraph1("Her designs for urban transport apps combine clarity with visual warmth."),
                       .image("ux-6"),
                       .subtitle1("Beyond the Screen"),
                       .paragraph2("Farah explores multisensory design, adding subtle audio and haptic cues.")
                   ],
                   isNew : true,
                   isBig: false
               ),

               // DATA SCIENCE
               Article(
                   titre: "Why Data Needs More Diversity",
                   intro: "This is the intro for Why Data Needs More Diversity.",
                   chapeau: "The story of why data needs more diversity as told by experts and pioneers. Representation matters as much in data as in design.",
                   tag: tagModel.dataScience,
                   datePublication: "19 juillet 2025",
                   imageCouv: "data-1",
                   contentArticle: [
                       .subtitle1("The Gaps"),
                       .paragraph1("Homogeneous datasets lead to biased algorithms. This article explores why diversity is key."),
                       .image("data-2"),
                       .subtitle1("Solving with Inclusion"),
                       .paragraph2("Experts suggest new data governance models that include diverse voices from the start.")
                   ],
                   isNew : true,
                   isBig: false
               ),
            Article(
                   titre: "Sana Predicts with Empathy",
                   intro: "Sana is changing the way we think about predictive models.",
                   chapeau: "She believes that models should be explainable and fair. Her work in healthcare analytics sets new standards for data ethics.",
                   tag: tagModel.dataScience,
                   datePublication: "15 juillet 2025",
                   imageCouv: "data-3",
                   contentArticle: [
                       .subtitle1("Explainability Matters"),
                       .paragraph1("Sana focuses on demystifying model decisions to gain user trust."),
                       .image("data-4"),
                       .subtitle1("Ethics First"),
                       .paragraph2("She collaborates with medical professionals to build fairer AI systems.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "Data for Change: Hiba’s Social Impact",
                   intro: "Hiba uses data science for good.",
                   chapeau: "From analyzing refugee data to optimizing food distribution, Hiba brings data where it's needed most.",
                   tag: tagModel.dataScience,
                   datePublication: "11 juillet 2025",
                   imageCouv: "data-5",
                   contentArticle: [
                       .subtitle1("Driven by Purpose"),
                       .paragraph1("Hiba partners with NGOs to apply machine learning for humanitarian efforts."),
                       .image("data-6"),
                       .subtitle1("A Global Lens"),
                       .paragraph2("She advocates for open data and community-led insights.")
                   ],
                   isNew : true,
                   isBig: false
               ),

               // ARTIFICIAL INTELLIGENCE
               Article(
                   titre: "Imane’s Ethical AI Crusade",
                   intro: "Imane is leading the fight for ethical AI systems.",
                   chapeau: "She believes AI must serve the many, not the few. Imane helps companies design responsible and inclusive AI algorithms.",
                   tag: tagModel.ai,
                   datePublication: "12 juillet 2025",
                   imageCouv: "ia-1",
                   contentArticle: [
                       .subtitle1("AI with Boundaries"),
                       .paragraph1("Imane creates frameworks to audit bias in machine learning pipelines."),
                       .image("ia-2"),
                       .subtitle1("From Ethics to Action"),
                       .paragraph2("She leads workshops that blend tech and philosophy.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "When Machines Learn to Translate Feelings",
                   intro: "Fatou builds AI that understands emotions.",
                   chapeau: "Her research blends psychology and natural language processing to help AI better interpret human moods.",
                   tag: tagModel.ai,
                   datePublication: "14 juillet 2025",
                   imageCouv: "ia-3",
                   contentArticle: [
                       .subtitle1("Understanding Emotion"),
                       .paragraph1("Fatou’s models analyze tone, rhythm, and context in conversations."),
                       .image("ia-4"),
                       .subtitle1("Tech with Heart"),
                       .paragraph2("She aims to make virtual assistants more empathetic and less robotic.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "Creative Code: Sarah and Generative AI",
                   intro: "Sarah uses generative AI to explore creativity.",
                   chapeau: "From music to fashion, Sarah pushes the boundaries of human-AI collaboration. Her work is redefining the creative process.",
                   tag: tagModel.ai,
                   datePublication: "9 juillet 2025",
                   imageCouv: "ia-5",
                   contentArticle: [
                       .subtitle1("Inspired by Machines"),
                       .paragraph1("Sarah blends machine outputs with human artistry for unique results."),
                       .image("ia-6"),
                       .subtitle1("A New Art Form"),
                       .paragraph2("She questions authorship and co-creation in the age of AI.")
                   ],
                   isNew : true,
                   isBig: false
               ),

               // DEVOPS
               Article(
                   titre: "The Pipeline Queen: Myriam’s DevOps Journey",
                   intro: "Myriam automates everything from code to deployment.",
                   chapeau: "Her CI/CD strategies help teams ship faster and safer. From Docker to Kubernetes, Myriam lives and breathes automation.",
                   tag: tagModel.devops,
                   datePublication: "13 juillet 2025",
                   imageCouv: "devops-1",
                   contentArticle: [
                       .subtitle1("The Build Master"),
                       .paragraph1("Myriam helps teams avoid build failures and reduce downtime."),
                       .image("devops-2"),
                       .subtitle1("Scale with Confidence"),
                       .paragraph2("Her infrastructure-as-code templates are used in multiple startups.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "Rania Bridges Dev and Ops",
                   intro: "Rania creates harmony between developers and sysadmins.",
                   chapeau: "She designs workflows that prioritize collaboration, security, and transparency across teams.",
                   tag: tagModel.devops,
                   datePublication: "16 juillet 2025",
                   imageCouv: "devops-3",
                   contentArticle: [
                       .subtitle1("Shared Responsibility"),
                       .paragraph1("Rania’s workshops train developers to own the deployment process."),
                       .image("devops-4"),
                       .subtitle1("Culture Shift"),
                       .paragraph2("She promotes DevSecOps values in large enterprises.")
                   ],
                   isNew : true,
                   isBig: false
               ),
               Article(
                   titre: "Yasmine’s Infra from the Cloud Up",
                   intro: "Yasmine modernizes infrastructure at scale.",
                   chapeau: "She’s leading cloud migrations with zero downtime. Her tools help orgs go serverless securely and efficiently.",
                   tag: tagModel.devops,
                   datePublication: "18 juillet 2025",
                   imageCouv: "devops-5",
                   contentArticle: [
                       .subtitle1("Cloud Pioneer"),
                       .paragraph1("Yasmine builds templates for Terraform, Helm, and beyond."),
                       .image("devops-6"),
                       .subtitle1("Efficiency Wins"),
                       .paragraph2("She reduces costs and improves agility through automation.")
                   ],
                   isNew : true,
                   isBig: false
               )
        ]
    }
    func FilteredArticles(currentArticle: Article) -> [Article] {
        return articlesArray.filter {$0.tag == currentArticle.tag && $0.id != currentArticle.id}.shuffled()  // shuffled() = Mélange aléatoirement les articles proposés
    }
}
