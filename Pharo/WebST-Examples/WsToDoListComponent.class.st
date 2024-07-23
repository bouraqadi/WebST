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

{ #category : 'initialization' }
WsToDoListComponent >> initModel [

	super initModel.
	model -@ #headingPort => [ :newTitle | self displayHeading: newTitle ]
]

{ #category : 'initialization' }
WsToDoListComponent >> initView [

	| addButton |
	super initView.
	headingDisplay := view querySelector: '.headingDisplay'.
	addButton := view querySelector: '.addItemButton'.
	self onClickElement: addButton do: [ self addItem ]
]
