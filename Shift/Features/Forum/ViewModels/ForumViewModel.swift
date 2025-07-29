//
//  ForumViewModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

@Observable
final class ForumViewModel {
    
    let user = UserModel()
        
    // FUNCTIONS TIED TO THE POSTS:
    
    // Return the 10 most recent posts (used in ForumView)
    func getLatestPosts() -> [Post] {
        return Array(posts.reversed().prefix(10))
    }
    
    // Return the 10 most recent posts marked as isHot (used in ForumView)
    func getHotPosts() -> [Post] {
        return Array(posts.reversed().lazy.filter { post in
                post.isHot
        }.prefix(2))
    }
    
    // Return filtered posts tagged by at least one mentioned tag (used in ForumView)
    func getFilteredPosts(categories: [String]) -> [Post] {
        return Array(posts.reversed().filter { post in
            post.tags.contains { tag in
                categories.contains(tag)
            }
        })
    }
    
    // Return all posts based on a text search (used in ForumView)
    func getSearchResults(_ searchText: String) -> [Post] {
        return posts.reversed().filter { post in
            post.title.lowercased().contains(searchText.lowercased()) ||
            post.content.lowercased().contains(searchText.lowercased())
        }
    }
    
    // Posts a new forum post (used in ForumNewPostView)
    func setNewPost(title: String, content: String, user: User, tags: [String]) {
        posts.append(Post(title: title, content: content, postedOn: Date(), user: user, numberOfLikes: 0, isHot: false, tags: tags))
    }
    
    // FUNCTIONS TIED TO THE TAGS (AKA CATEGORIES):
    
    // Returns an array containing all the tags where isToggled = true
    func getToggledTags() -> [String] {
        let toggledTags = tags.filter { tag in
            tag.isToggled
        }
        return toggledTags.map { tag in
            tag.name
        }
    }
    
    // Resets all tags isToggled properties to false, useful after getToggledTags() to go back to a clean state
    func resetToggledTags() {
        for tag in tags {
            tag.isToggled = false
        }
    }
    
    // DEFINITION OF TAGS (AKA CATEGORIES):
    
    let tags : [Tag] = [
        Tag(name: "Mentorship", icon: .usersThree),
        Tag(name: "Support", icon: .lifebuoy),
        Tag(name: "Training", icon: .atom),
        Tag(name: "Tech talk", icon: .circuitry),
        Tag(name: "Networking", icon: .sparkle),
        Tag(name: "Stories", icon: .chatDots)
    ]
    
    // INJECTION OF SAMPLE POSTS AND COMMENTS DATA:
    
    var posts : [Post] = [
        Post (
        title: "Monitor changes in a folder with Python in real-time",
        content: """
            Hey brilliant ladies! I’m currently working on a small side project that involves automatically processing files as soon as they’re added to a folder. I’m coding it in Python, and I’m a bit stuck on the best way to monitor a directory in real time for changes (like new files being created or existing files being modified).
            
            Basically what I want:

            • Detect when a new .csv file is added to a specific folder
            • Trigger a function (e.g., parse and clean the data) as soon as that happens
            • Ideally it should work cross-platform, but I’m mostly developing on Linux
            • I came across something called watchdog, but I’m not sure how stable or widely used it is? Is that the way to go? Are there other Pythonic options you’d recommend? Maybe using inotify directly? I'd love some guidance on how you’ve approached this kind of thing in your own projects.

            Also — if anyone has a small example script they’d be willing to share, I’d be so grateful! Thanks in advance for your time and brainpower. It’s always so inspiring to see how supportive this space is 💜

            P.S. Happy to share what I'm building once it's a bit further along — it's a fun tool for tracking food waste data in restaurants!
            """,
        postedOn: Date(),
        user: User(
            name: "Lisa",
            nickname: "LisaAa",
            picture: .anotherperson,
            city: "Toulouse",
            interests: [
                fieldOfInterests.uxui,
                fieldOfInterests.web,
                fieldOfInterests.cybersecurity
            ]
        ),
        numberOfLikes: 3,
        likedByUser: false,
        isHot: false,
        tags: ["Support", "Tech talk"],
        comments: [
            Comment(content: "go react native 😂😂😂", postedOn: Date(), user: User(name: "i h8 uikit",nickname: "i h8 uikit",picture: .userCircle, city: "nowhere",interests: []), numberOfLikes: 0, nestedLevel: 0),
            Comment(content: "yeah python is horrible anyways, have you tried using another language?", postedOn: Date(), user: User(name: "Mansplainer1984",nickname: "Mansplainer1984",picture: .userCircle, city: "Palo Alto",interests: []), numberOfLikes: 0, nestedLevel: 0),
            Comment(content: "i've seen a tuto for it on youtube, google \" python folder watcher\"", postedOn: Date(), user: User(name: "i h8 uikit",nickname: "i h8 uikit",picture: .userCircle, city: "nowhere",interests: []), numberOfLikes: 0, nestedLevel: 0),
            Comment(content: """
        Yes, watchdog is definitely the way to go for your use case. It’s actively maintained, works across platforms (Windows, macOS, Linux), and has a pretty clean API. Here’s a small example to get you started:
        
        from watchdog.observers import Observer
        from watchdog.events import FileSystemEventHandler
        import time
        import os

        class CSVHandler(FileSystemEventHandler):
            def on_created(self, event):
                if event.src_path.endswith(".csv"):
                    print(f"New CSV detected: {event.src_path}")
                    # Add your parsing logic here

        if __name__ == "__main__":
            path_to_watch = "/path/to/your/folder"
            event_handler = CSVHandler()
            observer = Observer()
            observer.schedule(event_handler, path=path_to_watch, recursive=False)
            observer.start()

            try:
                while True:
                    time.sleep(1)
            except KeyboardInterrupt:
                observer.stop()
            observer.join()
        
        A few notes:
        • Make sure to install watchdog first: pip install watchdog
        • You can expand this to handle modified/deleted files too if needed
        • Works well for small-scale use, but for large directories or high frequency changes, you might need to add debouncing/throttling logic
        Hope this helps!
        """, postedOn: Date(), user: User(name: "Anaïs",nickname: "anaisinparis",picture: .userCircle, city: "Paris",interests: []), numberOfLikes: 8, nestedLevel: 0),
        ],
    ),
        Post (
        title: "Offering mentorship for beginners",
        content: """
            Hi everyone, I'm a senior software engineer with 8 years of experience, and I'd like to offer mentorship to women who are starting their tech careers or looking to make a career change into tech.
            I've worked across different areas - web development, mobile apps, and some DevOps - so I can provide guidance on technical skills, interview prep, navigating workplace dynamics, and career planning. I'm also happy to do resume reviews or mock interviews.
            I know how challenging it can be to break into this field, especially as a woman, and I remember how much having a mentor helped me when I was starting out. I'd love to pay it forward.
            If you're interested, feel free to answer with some public contact info, like your WhatsApp or Signal username. I'm thinking we could do monthly video calls or whatever works best for your schedule. No charge, of course - just want to help support more women in tech. 👊
            Looking forward to connecting with some of you!
            """,
        postedOn: Date(),
        user: User(
            name: "Sarah",
            nickname: "TechMentor Sarah",
            picture: .sarah,
            city: "Paris",
            interests: [
                fieldOfInterests.ai,
                fieldOfInterests.cybersecurity
            ]
        ),
        numberOfLikes: 108,
        isHot: true,
        tags: ["Mentorship", "Support"]
    ),
        Post (
        title: "Who else is loving SwiftUI? 🚀",
        content: """
            Hey everyone!
            I've been working with SwiftUI for about 8 months now after years of struggling with UIKit, and I'm honestly having the best time coding I've had in ages. The declarative syntax just clicks with how I think about UI design, and being able to see live previews while I'm building components has been a game-changer for my workflow. I know there are still some limitations and quirks (don't get me started on navigation in complex apps 😅), but the rapid development cycle and how intuitive it feels has made me fall in love with iOS development all over again. Plus, the accessibility features are so much easier to implement properly!
            I'm curious - for those of you who've made the switch, what's been your favorite SwiftUI feature? And for anyone still on the fence, what's holding you back? I'd love to hear about your experiences, especially if you've had to convince your team or management to adopt it. Currently working on a side project that's 100% SwiftUI and it's been such a joy compared to the mixed UIKit/SwiftUI codebase at my day job. Anyone else finding themselves reaching for SwiftUI by default now?
            Hope everyone's having a great week! 💙
            """,
        postedOn: Date(),
        user: User(
            name: "Viviane",
            nickname: "vivi_a_ne",
            picture: .viviane,
            city: "Johannesburg",
            interests: [fieldOfInterests.uxui]
        ),
        numberOfLikes: 42,
        likedByUser: false,
        isHot: true,
        tags: ["Tech talk"],
        comments: [
            Comment(content: "UIKIT SUCKSSSSSSS", postedOn: Date(), user: User(name: "i h8 uikit",nickname: "i h8 uikit",picture: .userCircle, city: "nowhere",interests: []), numberOfLikes: 0, nestedLevel: 0),
            Comment(content: "I agree, wholeheartedly! My heart is with you, Viviane. My head hurts everytime I have to go back to UIKit 😭", postedOn: Date(), user: User(name: "Julie",nickname: "julie_la_codeuse",picture: .profile, city: "Montreuil",interests: [fieldOfInterests.uxui]), numberOfLikes: 5, nestedLevel: 0),
        ]
    ),
        Post (
        title: "DevOps Training Program for Women — Starting November 2025 in Montpellier! 🌟",
        content: """
            Hey everyone! 👋 I wanted to share an exciting opportunity for any women here who are either already working in DevOps or are looking to pivot into this field!
            Starting this November 2025, a new 6-month DevOps training program is launching exclusively for women, and it’s happening right here in Montpellier, France! 🎉
            This program is designed to support women in tech who want to deepen their expertise in DevOps practices, tools, and workflows. Whether you’re just getting started or already have some experience under your belt, this training is structured to help you grow technically and professionally in a supportive, inclusive environment.

            🔧 What’s in the program?

            • Hands-on workshops on CI/CD, infrastructure as code (Terraform, Ansible), containerization (Docker, Kubernetes)
            • Weekly labs and group projects with real-world scenarios
            • Mentorship from experienced DevOps engineers and professionals in the industry
            • Career development sessions, including mock interviews and resume help
            •Networking events with women working in tech across Occitanie
            
            💡 Who is it for?

            • Women (cis, trans, and non-binary people who feel comfortable in a women-centered space are welcome)
            • Residents of or able to commute to Montpellier for in-person sessions
            • Beginners with basic programming knowledge or junior devs wanting to specialize
            • No formal degree required — just motivation and willingness to learn!
            
            📅 Start Date: Monday, November 3rd, 2025
            🕓 Duration: 6 months (part-time schedule, ~20h/week)
            📍 Location: Montpellier TechLab campus (easily accessible by tram)
            💰 Cost: Free — fully funded through a regional initiative supporting women in digital careers

            If you're interested or want to get more details (like application steps, syllabus, or eligibility), feel free to write to: devops.montpellier.women2025@gmail.com

            I personally know one of the mentors involved in building this, and I can tell you they’re super committed to creating an empowering space for women in tech. 💪 If you’ve been looking for a way to level up or transition into DevOps, this might be the perfect chance! Feel free to drop questions here too, I’ll do my best to answer based on what I know.

            ✨ Let’s build awesome things — together.
            — CodeMuse34
            """,
        postedOn: Date(),
        user: User(
            name: "Muse",
            nickname: "CodeMuse34",
            picture: .muse,
            city: "Montpellier",
            interests: [
                fieldOfInterests.dataScience,
                fieldOfInterests.devops
            ]
        ),
        numberOfLikes: 48,
        likedByUser: true,
        isHot: false,
        tags: ["Training", "Networking"],
        comments: [
            Comment(content: "This sounds amazing! I’ve been wanting to get into DevOps for a while but didn’t know where to start. Just emailed them, thanks so much for sharing! 💜", postedOn: Date(), user: User(name: "Julie",nickname: "julie_la_codeuse",picture: .profile, city: "Montreuil",interests: [fieldOfInterests.uxui]), numberOfLikes: 8, nestedLevel: 0),
            Comment(content: "Wow, this is such a cool initiative. Great job France 🙌", postedOn: Date(), user: User(name: "Anita", nickname: "AniCodeAndCocktails", picture: .anita, city: "New York City", interests: [fieldOfInterests.web,fieldOfInterests.devops]), numberOfLikes: 3, nestedLevel: 0),
        ],
    ),
        Post (
        title: "NYC Tech Ladies Happy Hour? 🍹✨",
        content: """
            Hey gorgeous tech queens! 👑💻
            So I've been thinking... wouldn't it be amazing to get together for some drinks and good vibes? 🥂 I'm thinking of organizing a casual happy hour somewhere in Manhattan - maybe next Friday evening? 🗽
            Nothing too fancy, just us amazing women chatting about code, careers, and life over some well-deserved cocktails! 🍸💃 Whether you're a seasoned dev or just starting your tech journey, ALL are welcome! 🤗
            I'm thinking we could meet at that cute rooftop bar in SoHo around 6pm? 🌆 Perfect for networking without the stuffiness of formal events! Plus they have amazing nachos 🧀😋
            Drop a comment if you're interested and I'll create a group chat to sort out the details! Let's make this happen ladies! 💪✨
            Can't wait to meet you all IRL! 🥳
            xoxo 💋
            """,
        postedOn: Date(),
        user: User(
            name: "Anita",
            nickname: "AniCodeAndCocktails",
            picture: .anita,
            city: "New York City",
            interests: [
                fieldOfInterests.web,
                fieldOfInterests.devops
            ]
        ),
        numberOfLikes: 11,
        likedByUser: false,
        isHot: false,
        tags: ["Networking"],
        comments: [
            Comment(content: "This is such a cute idea!! I’m new to NYC and would love to meet other women in tech 💜 even better if drinks are involved!", postedOn: Date(), user: User(name: "JSQueenBee",nickname: "JSQueenBee", picture: .userCircle, city: "New York City",interests: []), numberOfLikes: 2, nestedLevel: 0),
        ]
    ),
    ]

}
