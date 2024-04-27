Class {
	#name : #WsToDoListView,
	#superclass : #WsListView,
	#category : #'WebSt-Examples-ToDoList'
}

{ #category : #rendering }
WsToDoListView >> renderOuterHtmlOn: html [

	html heading
		level2;
		class: 'headingDisplay'.
	super renderOuterHtmlOn: html.
	html button
		class: 'addItemButton btn btn-primary btn-lg';
		with: '+'
]
