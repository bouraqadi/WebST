Class {
	#name : 'WsToDoListApp',
	#superclass : 'WsSingleComponentApp',
	#category : 'WebST-Examples-ToDoList',
	#package : 'WebST-Examples',
	#tag : 'ToDoList'
}

{ #category : 'accessing' }
WsToDoListApp class >> rootComponentClass [

	^ WsToDoListComponent
]

{ #category : 'rendering' }
WsToDoListApp class >> title [

	<pharoJsSkip>
	^ 'Shopping - ToDo List WebST Example'
]

{ #category : 'initialization' }
WsToDoListApp >> initRootComponent [

	self rootComponent
		heading: 'Shopping List';
		addAllTexts:
			#( 'Bread' 'Peanut Butter' 'Soy Milk' 'Coffee' 'Sugar' 'Honey'
			   'Cereals' 'Strawberry Jam' )
]
