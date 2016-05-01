External Commands
----------------
This mod allows sending chat messages from outside minetest. Support for server commands is included.
The following command will send a chat message to all players on the server:

	echo [message] > [world folder]/message

Server commands are executed as the admin user specified by the "name" setting in minetest.conf, or as
a user called SERVER if no "name" setting is defined.  The results of server commands are written to
a file called "output" in the world.  The following command will grant "fly" access to the user "bob":

	echo "/grant bob fly" > [world folder]/message

The following command will execute the "/mods" server command and output a list of the currently
installed mods to the file "[world folder]/output":

	echo "/mods" > [world folder]/message
