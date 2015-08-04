# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
$(document).ready ->
    $('ol.sortable').nestedSortableTree
        debug: true
        forcePlaceholderSize: true
        handle: 'div'
        helper: 'clone'
        items: 'li'
        opacity: .75
        placeholder: 'placeholder'
        revert: 150
        maxLevels: 3
        tabSize: 55
        tolerance: 'pointer'
        toleranceElement: '> div'
    return
