Conan RPG Character Generator
===

A Rails webapp to create, save, and export characters for the upcoming Conan RPG by Mophidius Entertainment

- - - - -

Features
===
Baseline
---
  - Create a character and save it to your account
  - Maintain an index of characters
  - Export a character to a PDF character sheet

Future
---
  - Tooltips for game mechanics
  - Equipment
   - Weapons
   - Armor
   - Mounts
   - Tools
   - Misc
  - Update a character sheet values
  - Level up a character

- - - - -

TODO
===

Items are preceded by a **[number]** out of 10 that indicates severity of expected work

  - Views
    - General
      - **[5]** Get a custom font working
      - **[8]** Design and implement a custom theme
    - Home
      - **[?]** Design, implement
    - About
      - **[?]** Design, implement
    - Account
      - **[?]** Design, implement
    - Characters
      - Index
      - Random Generation
        - **[8]** Pipeline for "Click" -> Finish
      - Creation
        - General
          - **[10]** Get the chargen-app-box-thing to be responsively designed and well-fitted
          - **[8]** Final, constructed answer for: Continue working on making creation a form, or make it completely scripted?
          - **[7]** Scripting for back/next tabbing
        - Homeland
          - **[5]** Javascript to change class of card to "green" on selection
          - **[4]** Make cards more pleasant
          - **[4]** Choose an alternative selection method than cards? Table?
        - Aspects
          - **[8]** Script the choices, or make it into a form
          - **[6]** Reformat the box layout to not scroll the header
          - **[5]** Figure out the best way to design best/worst attribute selection
        - Caste
          - **[8]** Script the choices, or make it into a form
          - **[5]** Figure out a way to make the text boxes not so jumpy when tabbing b/w options
          - ~~**[3]** Make the subheaders more pronounced~~
          - ~~**[2]** Make the tab menu stretch to the bottom (ref. natures, educations)~~
        - Archetype
          - **[8]** Script the choices, or make it into a form
          - **[7]** Implement equipment selection
          - **[5]** Figure out a way to make the text boxes not so jumpy when tabbing b/w options
          - ~~**[3]** Change the subheader from equipment to the talent, make it more pronounced~~
          - ~~**[2]** Make the tab menu stretch to the bottom (ref. natures, educations)~~
        - Nature
          - **[8]** Script the choices, or make it into a form
          - **[8]** Make talent selection work, dynamic, and sensible
          - ~~**[3]** Make the subheaders more pronounced~~
        - Education
          - **[8]** Script the choices, or make it into a form
          - **[8]** Make talent selection work, dynamic, and sensible
          - **[6]** Make the variable skills work
          - ~~**[3]** Make the subheaders more pronounced~~
        - War Story
          - **[8]** Script the choices, or make it into a form
          - **[4]** Perhaps figure out a design that is more intuitive and fits into the aesthetic
        - Finishing touches
          - **[?]** Design, implement
  - Controllers
    - Characters
      - **[4]** Random tables for lifepaths
  - Account management
    - Authentication
    - Sessions
    - Change password
    - Delete account
  - Update database with full-release information/errata
