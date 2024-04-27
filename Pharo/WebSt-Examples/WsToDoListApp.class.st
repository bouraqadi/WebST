Class {
	#name : #WsToDoListApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTComponentApp',
	#classTraits : 'WsTComponentApp classTrait',
	#category : #'WebSt-Examples-ToDoList'
}

{ #category : #accessing }
WsToDoListApp class >> rootComponentClass [

	^ WsToDoListComponent
]

{ #category : #rendering }
WsToDoListApp class >> title [

	<pharoJsSkip>
	^ 'Shopping - ToDo List WebST Example'
]

{ #category : #initialization }
WsToDoListApp >> initRootComponent [

	self rootComponent
		heading: 'Shopping List';
		addAllTexts:
			#( 'Bread' 'Peanut Butter' 'Soy Milk' 'Coffee' 'Sugar' 'Honey'
			   'Cereals' 'Strawberry Jam' )
]
