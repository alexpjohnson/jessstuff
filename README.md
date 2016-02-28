
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Welcome to your Rails project on Cloud9 IDE!

To get started, just do the following:

1. Run the project with the "Run Project" button in the menu bar on top of the IDE.
2. Preview your new app by clicking on the URL that appears in the Run panel below (https://jessstuff-jrobins.c9users.io/).

Happy coding!
The Cloud9 IDE team


## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide

stuff i want to do:
- add new top level spec and add child and add parent need to re render stuff.. correctly
- confirmation on delete - "you sure? this will delete the following specs..."
- expand/contract specs
- soft delete instead of hard delete?
- checkboxes to edit multiple?
- make stuff endpoints
- fix deleting stuff*
- mass apply tags?
- archive tags
- validation on mass add
- mass adding children
- mass edit
- add 'ticketed' as a thing to filter by
- text editor? https://mindmup.github.io/bootstrap-wysiwyg/
- users
-   user settings...
-       show/hide describe/it
- progress bar for mass add
- count of items esp. when filtering
-   e.g., 'viewing x of y specs in project z'
- badges for filtering? like number of specs


done
- maybe wanna decrease padding or margin or whatever so specs are closer together
- ancestry gem*
- adding a parent at top level makes spec go all the way to the bottom. i mean i guess that makes sense*
    -  implement 'order' - by default it's id but adding parent the order of new parent is order of child and order
        of child becomes 1?
- filtering by label doesn't go deep enough*
- editing does not need to refresh the whole page
- i don't think we can add parents... that's maybe bad. ya we can
- fix stuff being editable when editing tags or specs
- add double spaces and 4 spaces to mass add?
- header needs to refresh after adding tags
- add ticket (as type of tag?) ticket vs label
- mass add something not right in unindenting *sigh*