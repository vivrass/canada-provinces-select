us-state-select-plugin
======================

From http://svn.techno-weenie.net/projects/plugins/us_states/, updated
to run under rails 2.2.

To select "priority" states that show up at the top of the list, call
like so:

    <%= us_state_select 'child', 'state', :priority => %w(TX CA) %> 

## Changing Option/Value with :show

The default...

    <%= us_state_select 'child', 'state'%> 

...will yield this:

    <option value="AK">Alaska</option>
    
- - -

Or you can change it up...

    <%= us_state_select 'child', 'state', :show => :full %> 

...and get this.

    <option value="Alaska">Alaska</option>

- - -

Options are:

* :full = <option value="Alaska">Alaska</option>
* :full_abb = <option value="AK">Alaska</option>
* :abbreviations = <option value="AK">AK</option>
* :abb_full_abb = <option value="AK">AK - Alaska</option>

You can also pass a proc to show:

    <%= us_state_select 'child', 'state', :show => Proc.new {|state| [state.first, state.first]} %> 
    
The array you are iterating over looks like this:

    [["Alaska", "AK"], ["Alabama","AL"], ...]