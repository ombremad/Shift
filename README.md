# SHIFT
*A space for women in tech to connect, grow and inspire each other.*

# Context

The second team project during our Apple Foundation Program Advanced training led our (mostly) women-driven team to take on an important issue: women working in tech.

During our CBL iteration, research showed that only 24 % of the workforce in the tech field were women, and those women are paid 22 % less than men on average (in France). Women in the tech field say they have to face discrimination, gender stereotypes, but also find it hard to learn about female role models, communities, local initiatives, or even job offers.

In this context, we deliberately went for an app that would feature both editorial and social components. As our most ambitious project to date (yet), we felt confident taking on a feature-rich, all-around app, with a subject that matters.

# Details

## Features

The app revolves around 5 key parts:
- Inspirations: learn about important women in the tech field throughout history
- Articles: know what's new in the tech industry for women, get inspired by interviews and stories...
- Forum: join a community ready to give advice, support, mentorship, tech talk, or just to chit-chat
- Events: find curated tech events dedicated to women close to your location, and get to network!
- Dashboard: a dynamic landing page that welcomes you every time you launch the app, with the best of other sections tightly packed in a convenient place.

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

Four people were part of this team project: [@Alitchoum](https://github.com/Alitchoum), [@Mlegoul](https://github.com/Mlegoul), [@Samaralimads](https://github.com/Samaralimads), and myself, [@Ombremad](https://github.com/ombremad).

The ideation process was done collectively, then each of us took on what they felt more comfortable working with (ie. flowchart, Figma design, visual choices...). In the end, everything was still decided and reviewed collectively. For instance, I felt more comfortable with thinking ahead our shared models and components, such as our User model (that is used in different parts of the app).

Code-wise, we split by feature and then helped each other with the remaining tasks. I took on the Forum part, all of what follows is my implementation:
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
