# SHIFT
*A space for women in tech to connect, grow and inspire each other.*

<img width="1920" height="1080" alt="SHIFT cover - Empowering women in tech, one shift at a time" src="https://github.com/user-attachments/assets/01b34fc2-82ae-411c-8e9a-b1dbff16dc46" />

# Context

The second team project during our Apple Foundation Program Advanced training led our (mostly) women-driven team to take on an important issue: women working in tech.

During our CBL iteration, research showed that only 24 % of the workforce in the tech field were women, and those women are paid 22 % less than men on average (in France). Women in the field say they have to face discrimination, gender stereotypes. They also find it hard to learn about female role models, communities, local initiatives, or even job offers.

In this context, we deliberately went for an app that would feature both editorial and social components. As our most ambitious project to date (yet), we felt confident going for a feature-rich, all-around app.

# Details

## Features

The app revolves around 5 key parts:
- Inspirations: learn about important women in the tech field throughout history
- Articles: know what's new in the tech industry for women, get inspired by interviews and stories...
- Forum: join a community ready to give advice, support, mentorship, tech talk, or just to chit-chat
- Events: find curated tech events dedicated to women close to your location, and get to network!
- Dashboard: a dynamic landing page that welcomes you every time you launch the app, with the best of other sections tightly packed in a convenient place.

<img width="201" height="437" alt="Inspirations preview" src="https://github.com/user-attachments/assets/ccc2fd7d-092d-4ebc-a313-fea5322c5a67" /> <img width="201" height="437" alt="Articles preview" src="https://github.com/user-attachments/assets/89cd18d7-3519-4e1d-ba86-353a43af679b" /> <img width="201" height="437" alt="Forum preview" src="https://github.com/user-attachments/assets/589f8b55-a313-4810-9cc6-30606d407bea" /> <img width="201" height="437" alt="Events preview" src="https://github.com/user-attachments/assets/df1f652a-1b5a-4584-8048-b046fae8b988" /> <img width="201" height="437" alt="Dashboard preview" src="https://github.com/user-attachments/assets/db01f961-3996-4454-87ac-ee482a03538c" />

*More screenshots can be found [at the end of this README](#features).*

## Constraints

Technically speaking, we had the following rules to follow:
- Xcode IDE, using Swift and SwiftUI
- Git collaboration in CLI
- mandatory MVVM structure app-wide
- mandatory UIKit implementation in a tiny part of an otherwise SwiftUI-app

## Caveats

- All user data is still local (no backend) and not permanently stored, as required at this stage of our training
- Some data shown in some sections is still hardcoded, and not actually connected to our View Model
- As is the norm with student projects under heavy time pressure, the code could use a lot of optimization, refactoring, etc.

## Who did it?

This was a team project, made by: [@Alitchoum](https://github.com/Alitchoum), [@Mlegoul](https://github.com/Mlegoul), [@Samaralimads](https://github.com/Samaralimads), and myself, [@Ombremad](https://github.com/ombremad).

The ideation process was done collectively, then each of us took on what they felt more comfortable working with (ie. flowchart, Figma design, visual choices...). In the end, everything was still decided and reviewed collectively. For instance, I felt more comfortable with thinking ahead our shared models and components, such as our User model (that is used in different parts of the app).

Code-wise, we split by feature and then helped each other with the remaining tasks. I took on the Forum part, all of what follows is my own implementation:
- all the models, view models, and views, sticking to the MVVM pattern
- a few demo posts are injected as a starting point
- user can post, comment, and like posts ; everything actually works
- other features:
  - "hot" posts are featured first
  - category tags for each post
  - browse posts by tags
  - search posts by text

We adopted Agile methods throughout, mostly a mix of Scrum + Kanban. Scrum Master duties were shared on a rolling schedule.

## When?

The whole project (including ideation, visual design, code and presentation) was done in July 2025. We only had a month, that also included time for the classes themselves. Code was left untouched after the end-of-project feature freeze, and is provided as-is.

# Feature previews

## Onboarding, dashboard & profile settings
<img width="201" height="437" alt="Onboarding preview 1" src="https://github.com/user-attachments/assets/e333e9a8-fdfa-4b00-8a45-22437b39981a" /> <img width="201" height="437" alt="Onboarding preview 2" src="https://github.com/user-attachments/assets/6c68fd66-fea5-4de1-bbaf-3dd6837f808f" /> <img width="201" height="437" alt="Dashboard" src="https://github.com/user-attachments/assets/db01f961-3996-4454-87ac-ee482a03538c" /> <img width="201" height="437" alt="Profile settings page" src="https://github.com/user-attachments/assets/bf3272c7-c1eb-4aa3-b211-c4ac6a8fe41b" />

## Inspirations
<img width="201" height="437" alt="Inspirations timeline" src="https://github.com/user-attachments/assets/ccc2fd7d-092d-4ebc-a313-fea5322c5a67" /> <img width="201" height="437" alt="Inspirations single woman view" src="https://github.com/user-attachments/assets/3d658552-db9f-432d-9666-65265d264e30" />

## Articles
<img width="201" height="437" alt="Articles home page" src="https://github.com/user-attachments/assets/89cd18d7-3519-4e1d-ba86-353a43af679b" /> <img width="201" height="437" alt="Single article page" src="https://github.com/user-attachments/assets/25f31040-fe97-4d88-819a-88e3cc14f0e7" />

## Forum
<img width="201" height="437" alt="Forum home page" src="https://github.com/user-attachments/assets/589f8b55-a313-4810-9cc6-30606d407bea" />  <img width="201" height="437" alt="Single forum post" src="https://github.com/user-attachments/assets/8784dcb2-924a-4784-b0d1-901e4c07d33f" /> <img width="201" height="437" alt="Answering a post inline" src="https://github.com/user-attachments/assets/42e3b7d2-e08a-4997-9342-474071e4eb84" /> <img width="201" height="437" alt="New post page" src="https://github.com/user-attachments/assets/2ebb10b7-1391-4f75-8234-d210fec5bdf7" /> <img width="201" height="437" alt="Filtering posts by tag" src="https://github.com/user-attachments/assets/fe03feca-34b3-4b07-976f-0028c370bf56" /> <img width="201" height="437" alt="Text search result in posts" src="https://github.com/user-attachments/assets/d251e625-f6f7-4882-97f7-6fc521a9b966" />

## Events
<img width="201" height="437" alt="Events home page" src="https://github.com/user-attachments/assets/df1f652a-1b5a-4584-8048-b046fae8b988" /> <img width="201" height="437" alt="Single events page" src="https://github.com/user-attachments/assets/9aecdaa9-327c-437e-8d82-fe476558015c" />

## Dark mode
<img width="201" height="437" alt="Dashboard in dark mode" src="https://github.com/user-attachments/assets/2404bca2-d5db-48a0-a8dc-46d1a9a98565" /> <img width="201" height="437" alt="Forum in dark mode" src="https://github.com/user-attachments/assets/701f6e49-02dd-4bb2-82c2-05b550195081" /> <img width="201" height="437" alt="Articles in dark mode" src="https://github.com/user-attachments/assets/af908e26-fa34-4fd2-8723-b8f1bb1b2cc9" />
