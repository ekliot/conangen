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

  - Database modeling
    - Update database with full-release information/errata
    - Remodel character lifepaths to use models from a different tables, i.e. "selected_aspects", "selected archetype", etc. to account for choices within lifepaths (alternative is to have choices be modeled in the character db entry, but this could get messy)
  - Views
    - General
      - **[5]** Get a custom font working
      - **[8]** Design and implement a custom theme
    - Home
      - **[6]** Design, implement
    - About
      - **[5]** Design, implement
    - Account
      - **[7]** Design, implement
    - Characters
      - Index
      - Random Generation
        - **[8]** Pipeline for "Click" -> Finish
      - Creation
        - General
          - **[10]** Get the chargen-app-box-thing to be responsively designed and well-fitted
          - **[7]** Scripting for back/next tabbing
        - Homeland
          - **[4]** Make cards more pleasant
          - **[4]** Choose an alternative selection method than cards? Table?
        - Aspects
          - **[6]** Reformat the box layout to not scroll the header
          - **[5]** Fix total attrs for former mand attrs resetting to 0 after switching aspects
          - **[9]** Make the table more pleasing to look at
        - Caste
          - Nil
        - Archetype
          - **[7]** Implement equipment selection (tbd after equipment db is implemmented)
          - **[3]** Make the subheaders more pronounced
        - Nature
          - **[8]** Make talent selection work, dynamic, and sensible
          - **[3]** Make the subheaders more pronounced
        - Education
          - **[8]** Make talent selection work, dynamic, and sensible
          - **[3]** Make the subheaders more pronounced
        - War Story
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
