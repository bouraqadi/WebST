Class {
	#name : 'WsToDoListComponent',
	#superclass : 'WsTextListComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'headingDisplay'
	],
	#category : 'WebST-Examples-ToDoList',
	#package : 'WebST-Examples',
	#tag : 'ToDoList'
}

{ #category : 'accessing' }
WsToDoListComponent class >> itemComponentClass [

	^ WsToDoItemComponent 
]

{ #category : 'accessing' }
WsToDoListComponent class >> modelClass [
	^WsToDoListModel 
	
]

{ #category : 'class initialization' }
WsToDoListComponent class >> tagName [

	^ 'ws-todo-list'
]

{ #category : 'accessing' }
WsToDoListComponent class >> viewClass [

	<pharoJsSkip>
	^ WsToDoListView
]

{ #category : 'initialization' }
WsToDoListComponent >> beReady [

	| addButton |
	super beReady.
	headingDisplay := self viewFirstElementByCssClass: 'headingDisplay'.
	addButton := self viewFirstElementByCssClass: 'addItemButton'.
	self onClickElement: addButton do: [ self addItem ].
	model -@ #headingPort => [ :newTitle | self displayHeading: newTitle ].
]

{ #category : 'actions' }
WsToDoListComponent >> displayHeading: aString [

	headingDisplay textContent: aString
]

{ #category : 'initialization' }
WsToDoListComponent >> displayModel [

	super displayModel.
	self displayHeading: model heading
]

{ #category : 'accessing' }
WsToDoListComponent >> heading: newTitle [

	model heading: newTitle
]
